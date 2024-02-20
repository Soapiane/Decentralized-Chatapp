import React from "react";

export default function InputForm({ placeholder, name, password, Ref }) {
  return (
    <>
      <p className=" pb-2 text-lg pt-5">{name}</p>
      <div className="rounded-xl border-white border w-full ">
        <input
          className="w-full py-3 px-10 text-lg  bg-transparent border-white outline-none"
          type={password === true ? "password" : "text"}
          placeholder={placeholder}
          ref={Ref}
        />
      </div>
    </>
  );
}
