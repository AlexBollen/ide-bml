import { exec } from "child_process";

export default function handler(req, res) {
  if (req.method === "POST") {
    // const filePath = path.join(__dirname, "ejecutable")
    const filePath = './pages/api/ejecutable'
    exec(`${filePath} < ./pages/api/Ejemplo4.Rb`, (error, stdout, stderr) => {
      if (error) return res.status(500).json({ error: stderr });
      res.status(200).json({ output: stdout });
    });
  } else {
    res.status(405).json({ message: "Method Not Allowed" });
  }
}
