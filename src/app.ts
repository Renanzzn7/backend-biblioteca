import { app } from "./server.js";
import { DatabaseModel } from "./model/DataBaseModel.js";

const port = 3333;

(async () => {
    const dbModel = new DatabaseModel();
    const ok = await dbModel.testeConexao();
    if (!ok) {
        console.log("❌ Não foi possível conectar ao banco de dados");
        process.exit(1);
    }
    app.listen(port, () => {
        console.log(`🚀 Servidor rodando em http://localhost:${port}`);
    });
})();