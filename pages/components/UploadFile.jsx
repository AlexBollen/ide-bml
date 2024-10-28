import { Box, Button, Input } from "@chakra-ui/react";
import { useRef, useState } from "react";

const UploadFile = ({ onFileUpload }) => {
  const inputRef = useRef(null);
  const [fileName, setFileName] = useState("");

  const handleFileChange = (event) => {
    const file = event.target.files[0];
    if (file) {
      setFileName(file.name)
      const reader = new FileReader();
      reader.onload = (e) => {
        const fileContent = e.target.result;
        onFileUpload(fileContent);
      };
      reader.readAsText(file);
    }
  };

  const handleButtonClick = () => {
    inputRef.current.click();
  };

  return (
    <Box>
      <Button onClick={handleButtonClick} color="gray.300">
        Subir archivo
      </Button>

      <Input
        ref={inputRef}
        type="file"
        accept=".txt"
        onChange={handleFileChange}
        style={{ display: "none" }}
      />
    </Box>
  );
};
export default UploadFile;
