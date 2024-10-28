import Head from "next/head";
import styles from "../styles/Home.module.css";
import { Box, ChakraProvider, ThemeProvider } from "@chakra-ui/react";
import CodeEditor from "./components/CodeEditor";
import theme from "./theme";

export default function Home() {
  return (
    <ChakraProvider theme={theme}>
      <Box minH="100vh" bg="#0f0a19" color="gray.500" px={6} py={8}>
        <CodeEditor />
      </Box>
    </ChakraProvider>
  );
}
