import React, { useState } from "react";
import { Box, Text, Button } from "@chakra-ui/react";

const Output = ({ code }) => {
  const [output, setOutput] = useState("");

  const executeFile = async () => {
    try {
      const response = await fetch("/api/execute", {
        method: "POST",
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ content: code })
      });
      const data = await response.json();
      setOutput(data.output || data.error);
    } catch (error) {
      console.error("Error ejecutando el archivo", error);
      setOutput("Error ejecutando el archivo");
    }
  };

  return (
    <Box h="50%" w="40%">
      <Text mb={2} fontSize="lg">
        Output
      </Text>
      <Button
        variant="outline"
        colorScheme="green"
        mb={4}
        onClick={executeFile}
      >
        Run Code
      </Button>
      <Box
        height="75vh"
        p={2}
        border="1px solid"
        borderRadius={4}
        borderColor="white.200"
      >
        Prueba tu código!!
        {output && <pre>{output}</pre>}
      </Box>
    </Box>
  );
};

export default Output;
