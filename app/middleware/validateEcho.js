export function validateEcho(req, res, next) {
    const { name, role } = req.body

    if (!name || typeof name !== 'string') {
        return res.status(400).json({
          error: 'Name is required and must be a string"',
        });
    }

    if (!role || typeof role !== 'string') {
        return res.status(400).json({
          error: 'Role is required and must be a string"',
        });
    }

    next();
}