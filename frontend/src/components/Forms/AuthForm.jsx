import React, { useRef, useState } from "react";
import Logo from "../../assets/Logo.svg";
import ButtonForm from "../ButtonForm";
import InputForm from "../InputForm";
export default function AuthForm({ forSigning }) {
  const nameInput = useRef(null);
  const passwordInput = useRef(null);
  const passwordConfirmation = useRef(null);
  function handleSubmit(e) {
    e.preventDefault();
    console.log(nameInput.current.value);
    console.log(passwordInput.current.value);
    if (forSigning ){
      if(passwordInput.current.value===passwordConfirmation.current.value){
        console.log("password valid")
      }else{
        console.log("password invalid")
      }
      passwordConfirmation.current.value = "";
    }
    nameInput.current.value = "";
    passwordInput.current.value = "";
  }
  return (
    <form onSubmit={handleSubmit}>
      <InputForm
        placeholder="Username"
        name="Enter username"
        password={false}
        Ref={nameInput}
      />
      <InputForm
        placeholder="Password"
        name="Enter password"
        password={true}
        Ref={passwordInput}
      />
      {forSigning && (
        <InputForm
          placeholder="Password"
          name="Confirm password"
          password={true}
          Ref={passwordConfirmation}
        />
      )}
      <ButtonForm />
    </form>
  );
}
