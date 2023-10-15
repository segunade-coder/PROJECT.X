/* eslint-disable no-unused-vars */
import { useEffect, useState } from "react";
import {
  RiArrowLeftLine,
  RiEyeCloseFill,
  RiEyeOffFill,
  RiLock2Fill,
  RiSignalWifiOffLine,
  RiUser3Fill,
  RiUser6Line,
} from "react-icons/ri";
import "./customlogin.css";
import { useNavigate, useSearchParams } from "react-router-dom";
import { ErrorPage } from "../../routes";
// import logo_url from "../../images/preview-eye.jpg";
import { Buffer } from "buffer";
import toast, { Toaster } from "react-hot-toast";
import { Checkbox } from "primereact/checkbox";
import { Button } from "primereact/button";
import { Ripple } from "primereact/ripple";
import { ProgressSpinner } from "primereact/progressspinner";
import notifications from "../Main/Helpers/Notifications";

const CustomLogin = () => {
  const [fetchSchoolState, setFetchSchoolState] = useState(true);
  const [isSchoolPresent, setIsSchoolPresent] = useState(true);
  const [error, setError] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [schoolName, setSchoolName] = useState("");
  // eslint-disable-next-line no-unused-vars
  // const [url] = useState(""); // online
  const [url] = useState(notifications.url);
  const urlPath = window.location.pathname;
  const navigate = useNavigate();
  const [logo, setLogo] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [rememberMe, setRememberMe] = useState(true);
  let [searchParams] = useSearchParams();
  let go_to = searchParams.get("redirect");
  document.title = "Login | Paymof";

  useEffect(() => {
    let school_name = urlPath.split("/")[urlPath.split("/").length - 1];
    setSchoolName(school_name.replace(/-/g, " "));
    if (schoolName) {
      fetch(
        `${url}/custom-login/?school_name=${schoolName
          .toLowerCase()
          .trim()
          .replace(/ /g, "-")}`,
        {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
          },
          credentials: "include",
        }
      )
        .then((res) => res.json())
        .then((data) => {
          if (data.status) {
            if (data.response.logo["data"].length > 0) {
              const base64String = Buffer.from(data.response.logo).toString(
                "base64"
              );

              const imageUrl = `data:image/jpeg;base64,${base64String}`;
              setLogo(imageUrl);
            }
            setFetchSchoolState(false);
          } else {
            setIsSchoolPresent(false);
          }
        })
        .catch((err) => {
          setError("Something went wrong. Try refreshing.");
        });
    }
  }, [urlPath, schoolName, url]);

  useEffect(() => {
    if (typeof localStorage !== "undefined") {
      try {
        if (window.localStorage.getItem("username")) {
          let username = window.localStorage.getItem("username") || "";
          if (username !== "" && username !== null) {
            setPassword(password);
            setUsername(username);
          }
        }
      } catch (error) {
        console.log(error);
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [document.readyState]);

  let handleLogin = (e) => {
    e.preventDefault();
    if (schoolName !== "" && username !== "" && password !== "") {
      setIsLoading(true);
      let loginLoading = toast.loading("Loading...", { id: "thid" });
      fetch(`${url}/login`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
        body: JSON.stringify({
          school: schoolName,
          user: username,
          pass: password,
        }),
      })
        .then((res) => res.json())
        .then((data) => {
          // toast.dismiss(loginLoading);
          setIsLoading(false);
          if (data.error) {
            toast.error(data.message, { id: "thid" });
          } else {
            toast.dismiss("thid");
            if (
              go_to &&
              go_to.includes(`${schoolName.toLowerCase().replace(/ /g, "_")}`)
            ) {
              window.location.href = go_to;
            } else {
              navigate(`../${schoolName.toLowerCase().replace(/ /g, "_")}/`);
            }
            if (typeof localStorage !== "undefined") {
              try {
                if (rememberMe) {
                  window.localStorage.setItem("school", schoolName);
                  window.localStorage.setItem("username", username);
                } else {
                  window.localStorage.removeItem("school", schoolName);
                  window.localStorage.removeItem("username", username);
                }
              } catch (error) {
                console.log(error);
              }
            }
          }
        })
        .catch((err) => {
          // toast.dismiss(loginLoading);
          setIsLoading(false);
          toast.error(err, { id: "thid" });
        });
    } else {
      toast.error("All fields are required", { id: "hfjasaaaaaiitr7fk" });
    }
  };
  return (
    <div className="__custom-login">
      {fetchSchoolState ? (
        isSchoolPresent ? (
          <div
            className={
              error === ""
                ? "loading-state card flex justify-content-center"
                : "loading-state error"
            }
          >
            {error !== "" ? (
              <div className="error-inner">
                <RiSignalWifiOffLine size={40} />
                <h2 className="h2">
                  <br /> {error}
                </h2>
              </div>
            ) : (
              <ProgressSpinner />
            )}
          </div>
        ) : (
          <ErrorPage />
        )
      ) : (
        <div className="login-container">
          <div>
            <Toaster position="top-center" reverseOrder={false} />
          </div>
          <div className="grid-2">
            <div className="form-area">
              <div className="headling-cont">
                <h2>Sign in</h2>
                <span onClick={() => navigate("../login")}>
                  <RiArrowLeftLine size={30} fill="#fff" />
                </span>
              </div>
              <form onSubmit={(e) => handleLogin(e)}>
                <div className="form-input-icons">
                  <input
                    type="text"
                    placeholder="Username"
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                  />
                  <span>
                    <RiUser3Fill fill="#fefefe" size={20} className="icon-up" />
                  </span>
                </div>
                <div className="form-input-icons">
                  <input
                    type={showPassword === true ? "text" : "password"}
                    placeholder="Password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                  />
                  <span>
                    <RiLock2Fill fill="#fefefe" size={20} className="icon-up" />
                  </span>
                  <span className="show-icon-container">
                    {!showPassword ? (
                      <RiEyeCloseFill
                        fill="#fefefe"
                        size={20}
                        className="show-pass"
                        onClick={() => setShowPassword(true)}
                      />
                    ) : (
                      <RiEyeOffFill
                        fill="#fefefe"
                        size={20}
                        className="show-pass"
                        onClick={() => setShowPassword(false)}
                      />
                    )}
                  </span>
                </div>
                <Button
                  type="submit"
                  loading={isLoading}
                  label="Submit"
                  className="p-ripple"
                  severity="secondary"
                >
                  <Ripple />
                </Button>
                <div className="checkbox-form">
                  <label htmlFor="rememberMe">
                    <Checkbox
                      id="rememberMe"
                      checked={rememberMe}
                      onChange={(e) => setRememberMe(e.checked)}
                    />
                    {/* <span className="custom-checkbox"></span> */}
                    Remember me
                  </label>
                  <a href="#">Forgot password</a>
                </div>
              </form>
            </div>

            <div className="discription-image">
              <h2>Hello Again! </h2>
              <small>Welcome back you&apos;ve been missed</small>
              <div className="school-details">
                <span>
                  {!logo ? (
                    <RiUser6Line size={100} />
                  ) : (
                    <img src={logo} alt="" />
                  )}
                </span>
                <h4 className="school-name">{schoolName}</h4>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default CustomLogin;
