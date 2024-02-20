import React, { useState } from "react";
import { Chat, Create, Home, Join, Signup, Login } from "./pages";

import {
  Route,
  RouterProvider,
  createBrowserRouter,
  createRoutesFromElements,
} from "react-router-dom";
import { ChakraProvider } from "@chakra-ui/react";
import AuthLayout from "./layouts/AuthLayout";

const router = createBrowserRouter(
  createRoutesFromElements(
    <Route path="/">
      <Route path="home" element={<Home />} />
      <Route element={<AuthLayout/>}>
        <Route path="signup" element={<Signup />} />
        <Route path="login" element={<Login />} />
      </Route>
      <Route path="chat" element={<Chat />} />
      <Route path="create" element={<Create />} />
      <Route path="join" element={<Join />} />
    </Route>
  )
);
export default function App() {
  return (
    <ChakraProvider >
      <RouterProvider router={router}/>
    </ChakraProvider>
  );
}
