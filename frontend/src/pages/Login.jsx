import React from "react";
import Arrow from "../assets/Arrow.svg";
import { AuthForm } from "../components";
import { Link } from "react-router-dom";
export default function Login() {
  return (
    <>
      <p className="text-center text-2xl pt-5 ">Login to your account !</p>
      <div className="py-1">
        <AuthForm forSigning={false} />
      </div>
      <p className="text-white text-center pt-1">
        Dont have an account ?
        <Link to="/signup" className="text-[#7083AA] underline">
          {" "}
          Sign up
        </Link>
      </p>
    </>
  );
}
