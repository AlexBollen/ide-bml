import { exec } from "child_process";
import fs from "fs";

export default function handler(req, res) {
  if (req.method === "POST") {
    const filePath = "./pages/api/BMLangAssembler";
    const code = req.body.content;
    handleSaveFile(code);
    exec(
      `${filePath} < ./pages/api/uploads/code.ml`,
      (error, stdout, stderr) => {
        if (error) return res.status(500).json({ error: stderr });
        res.status(200).json({ output: stdout });
      }
    );
  } else {
    res.status(405).json({ message: "Method Not Allowed" });
  }
}

const handleSaveFile = (content) => {
  try {
    const codePath = "./pages/api/uploads/code.ml";
    fs.writeFileSync(codePath, content, "utf8");

    console.log("Archivo guardado exitosamente");
  } catch (error) {
    console.log("Error al guardar el archivo", error);
  }
};
