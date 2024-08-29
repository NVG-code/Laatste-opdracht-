export function errorHandler(err, req, res, next) {
  console.error(err.stack);
  res.status(500).json({ message: "Er is een fout opgetreden op de server!" });
}
