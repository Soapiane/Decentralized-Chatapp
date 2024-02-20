import React from "react";
import { Link } from "react-router-dom";
import { AuthForm } from "../components";
export default function Signup() {
  return (
    <>
      <p className="text-center text-2xl pt-5 ">Create an account !</p>
      <div className="py-1">
        <AuthForm forSigning={true} />
      </div>
      <p className="text-white text-center pt-1">
        Already have an account ?
        <Link to="/login" className="text-[#7083AA] underline">
          {" "}
          Log in
        </Link>
      </p>
    </>
  );
}
