import React from "react";
import { Route, Routes } from "react-router-dom";
import Hello from "./Hello";



export default function ApplicationViews() {
  return (
      <Routes>
        <Route path="/" element={<Hello />} />
    </Routes>
  );
}
