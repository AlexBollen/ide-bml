import { Box, Button, HStack, Text } from "@chakra-ui/react"
import { Editor } from "@monaco-editor/react"
import { useState, useRef } from "react"
import { DeleteIcon, DownloadIcon } from "@chakra-ui/icons";
import UploadFile from "./UploadFile"
import Output from "./Output";

const CodeEditor = () => {
  const editorRef = useRef()
  const [value, setValue] = useState('')

  const onMount = (editor) => {
    editorRef.current = editor;
    editor.focus()
    setValue(editor.getValue())
  }

  const handleFileUpload = (fileContent) => {
    setValue(fileContent);
  };

  const handleClearCodeArea = () => {
    setValue("");
  }

  const handleSaveFile = () => {
    const fileContent = value || editorRef.current.getValue();
    const blob = new Blob([fileContent], { type: "text/plain" });
    const link = document.createElement("a");
    link.href = URL.createObjectURL(blob);
    link.download = "miArchivo.ml";
    link.click();
  }

  return (
    <Box>
      <HStack spacing={4}>
        <Box w="60%">
          <Text mb={2} fontSize="lg">
            Actions
          </Text>
          <HStack spacing={4} mb={4}>
            <UploadFile onFileUpload={handleFileUpload} />
            <Button onClick={handleClearCodeArea} color="gray.300">
              <DeleteIcon />
            </Button>
            <Button onClick={handleSaveFile} color="gray.300">
              <DownloadIcon />
            </Button>
          </HStack>
          <Editor 
            height="75vh"
            theme="vs-dark" 
            defaultValue="// Empieza a desarrollar!!"
            onMount={onMount}
            value={value}
            onChange={
              (value) => setValue(value)
            }
          />
        </Box>
        <Output code={value}/>
      </HStack>
    </Box>
  )
}
export default CodeEditor