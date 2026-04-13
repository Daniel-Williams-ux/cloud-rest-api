# -------------------------------
# TARGET GROUP
# -------------------------------
resource "aws_lb_target_group" "api_tg" {
  name     = "api-target-group"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main_vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}


# -------------------------------
# ATTACH EC2 TO TARGET GROUP
# -------------------------------
resource "aws_lb_target_group_attachment" "api_tg_attachment" {
  target_group_arn = aws_lb_target_group.api_tg.arn
  target_id        = aws_instance.api_server.id
  port             = 3000
}


# -------------------------------
# APPLICATION LOAD BALANCER
# -------------------------------
resource "aws_lb" "api_alb" {
  name               = "api-alb"
  load_balancer_type = "application"
  subnets = [
    aws_subnet.public_subnet.id,
    aws_subnet.public_subnet_2.id
  ]
  security_groups    = [aws_security_group.api_sg.id]

  tags = {
    Name = "api-alb"
  }
}

# -------------------------------
# ALB LISTENER
# -------------------------------
resource "aws_lb_listener" "api_listener" {
  load_balancer_arn = aws_lb.api_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api_tg.arn
  }
}