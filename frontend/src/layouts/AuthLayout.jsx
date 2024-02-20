import React from "react";
import { Outlet } from "react-router-dom";
import Arrow from "../assets/Arrow.svg";
import Logo from "../assets/Logo.svg";

export default function AuthLayout() {
  return (
    <div class="radial-gradient ">
      <div className="flex flex-col min-h-[100vh]  text-white">
        <div className="pt-6 pl-6">
          <div className="flex items-center ">
            <div class="radial-gradient-arrow">
              <div className="h-[100px] w-[100px] flex justify-center items-center">
                <img src={Arrow} className="mx-auto my-auto" />
              </div>
            </div>
          </div>
        </div>

        <div className="grow flex justify-center items-center flex-col ">
          <div className=" w-[530px]">
            <div className="flex justify-center gap-1 items-center text-6xl text-white ">
              <img src={Logo} alt="" />
              <h1>Whisper</h1>
            </div>
            <Outlet />
          </div>
        </div>
      </div>
    </div>
  );
}
