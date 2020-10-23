/**
 * Responds to any HTTP request.
 *
 * @param {!express:Request} req HTTP request context.
 * @param {!express:Response} res HTTP response context.
 */
exports.helloGET = (req, res) => {
    let message = req.query.message || `Clustor name: ${process.env.K8S_CLUSTER_NAME} ${req.body.message}` || 'Hello World!';
    res.status(200).send(message);
};
  