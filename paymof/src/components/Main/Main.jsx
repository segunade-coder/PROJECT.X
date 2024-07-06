import { Suspense, useEffect, useState, useRef } from "react";
import { NavLink, Outlet, useLocation, useNavigate } from "react-router-dom";
import { MainContext } from "./Helpers/Context";
import { Buffer } from "buffer";
import { Toaster } from "react-hot-toast";
import {
  RiMoneyCnyCircleLine,
  RiExchangeLine,
  RiDatabaseLine,
  RiUserAddLine,
  RiDashboardLine,
  RiNotification2Line,
  RiDeviceLine,
  RiSettings3Line,
  RiFileUserLine,
  RiLogoutCircleRLine,
  RiWifiOffLine,
  RiWifiLine,
  RiMenu3Fill,
  RiArrowDropRightLine,
  RiWalletLine,
  RiUser4Line,
  RiUserSettingsLine,
  RiCalendar2Line,
} from "react-icons/ri";
import "./main.css";
import Loader from "../small_comps/loader/Loader";
import socketIOClient from "socket.io-client";
import notifications from "./Helpers/Notifications";
import logo_prev from "../../images/preview-eye.png";

import { SplitButton } from "primereact/splitbutton";
// import { Message } from "primereact/message";
import PrimeReact from "primereact/api";
import { ConfirmDialog } from "primereact/confirmdialog";
import { Toast } from "primereact/toast";
import { Badge } from "primereact/badge";
import { ScrollTop } from "primereact/scrolltop";
// eslint-disable-next-line no-unused-vars
import { ScrollPanel } from "primereact/scrollpanel";
import { Image } from "primereact/image";
const Main = () => {
  const [loggedSchool, setloggedSchool] = useState("");
  const [loggedUser, setLoggedUser] = useState("");
  const [admin, setAdmin] = useState(false);
  // const [url] = useState("");
  const [url] = useState(notifications.url);
  const [logo, setLogo] = useState(logo_prev);
  const [isConnected, setIsConnected] = useState(true);
  const [notificationsArr, setNotificationsArr] = useState([]);
  const [collapseNav, setCollapseNav] = useState(false);
  const [customLogin, setCustomLogin] = useState("");
  let disConnect = useRef(0);
  let redirect = useRef(0);
  let toastRef = useRef(null);
  let navigate = useNavigate();
  const io = socketIOClient(url);
  const connectionAlert = useRef(null);
  const showOnce = useRef(0);
  const [notiNum, setNotiNum] = useState("");
  PrimeReact.ripple = true;
  let location = useLocation();
  let pathtitle = location.pathname.split("/");
  let schoolArr = loggedSchool.split(" ");
  let template = "";
  template = schoolArr.map(
    (school) => school.charAt(0).toUpperCase() + school.slice(1)
  );
  try {
    if (loggedSchool) {
      if (pathtitle[pathtitle.length - 1] !== "")
        document.title = `${
          pathtitle[pathtitle.length - 1].charAt(0).toUpperCase() +
          pathtitle[pathtitle.length - 1].slice(1)
        } | ${template.join(" ")}`;
      else document.title = `Dashboard | ${`${template.join(" ")}`}`;
    }
  } catch (error) {
    console.log(error);
  }
  // });
  // logout on inactivity

  useEffect(() => {
    if (typeof localStorage !== "undefined") {
      try {
        try {
          window.localStorage.getItem("background") &&
            document.documentElement.style.setProperty(
              "--mainBgColor",
              window.localStorage.getItem("background")
            );
          window.localStorage.getItem("secondary") &&
            document.documentElement.style.setProperty(
              "--mainSecondaryColor",
              window.localStorage.getItem("secondary")
            );
          window.localStorage.getItem("accent") &&
            document.documentElement.style.setProperty(
              "--mainAccentColor",
              window.localStorage.getItem("accent")
            );
          window.localStorage.getItem("text") &&
            document.documentElement.style.setProperty(
              "--textColor",
              window.localStorage.getItem("text")
            );
          window.localStorage.getItem("secondary-text") &&
            document.documentElement.style.setProperty(
              "--secondaryTextColor",
              window.localStorage.getItem("secondary-text")
            );
          window.localStorage.getItem("secondary-text") &&
            document.documentElement.style.setProperty(
              "--secondaryTextIcon",
              window.localStorage.getItem("secondary-text")
            );
        } catch (error) {
          console.log(error);
        }
      } catch (error) {
        console.log(error);
      }
    }
  });
  useEffect(() => {
    if (isConnected) {
      if (disConnect.current === 1) {
        !connectionAlert.current.classList.contains("connected") &&
          connectionAlert.current.classList.add("connected");
        connectionAlert.current.classList.contains("disconnected") &&
          connectionAlert.current.classList.remove("disconnected");
        document.getElementById("conn").innerText = "Back online";
        setTimeout(
          () => connectionAlert.current.classList.remove("connected"),
          3000
        );
      }
    } else {
      !connectionAlert.current.classList.contains("disconnected") &&
        connectionAlert.current.classList.add("disconnected");
      connectionAlert.current.classList.contains("connected") &&
        connectionAlert.current.classList.remove("connected");
      document.getElementById("conn").innerText = "Connection lost";
    }
  }, [isConnected]);

  useEffect(() => {
    io.on("connect", () => {
      setIsConnected(true);
    });

    io.on("connect_failed", () => {
      setIsConnected(false);
    });
    io.on("connect_error", () => {
      setIsConnected(false);
    });
    io.on("disconnect", () => {
      console.log("disconnected");
      disConnect.current = 1;
      setIsConnected(false);
    });

    io.on("show_notification", (data) => {
      if (data) {
        setNotificationsArr([...notificationsArr, data]);
        [data].map((info) => {
          toastRef.current.show({
            severity: "success",
            summary: "success",
            detail: info.message,
            life: 7000,
          });
        });
      }
    });
    return () => {
      io.off("connection");
      io.off("disconnect");
      io.off("get-notification");
      io.close();
    };
  }, [io, loggedSchool, notiNum, notificationsArr]);

  useEffect(() => {
    if (loggedSchool) {
      io.emit("get-notification", { loggedSchool, loggedUser });
    }

    io.on("notification", (data) => {
      // console.log(data);
      if (data[0].count > 0) {
        if (data[0].count > 100) {
          setNotiNum("99+");
        } else {
          setNotiNum(data[0].count);
        }
        if (data[0].count > 5) {
          if (showOnce.current === 0) {
            toastRef.current.show({
              severity: "info",
              summary: "Notifications",
              icon: "pi pi-bell",
              detail: "You have some unread notifications",
              sticky: true,
            });
            showOnce.current += 1;
          }
        }
      } else {
        setNotiNum("");
      }
    });
  });
  useEffect(() => {
    document.addEventListener("wheel", () => {
      if (document.activeElement.type === "number") {
        document.activeElement.blur();
      }
    });
    fetch(`${url}/main`, {
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
      },
      method: "GET",
    })
      .then((res) => res.json())
      .then((data) => {
        if (data.creds) {
          if (data.creds.school) {
            setLoggedUser(data.creds.user);
            setloggedSchool(data.creds.school);
            setAdmin(data.creds.admin);
            setCustomLogin(data.creds.customLogin);
            if (data.creds.admin === false) {
              let pathname = location.pathname.split("/");
              let unauthorizePage = [
                "users",
                "settings",
                "wallet",
                "backup",
                "wallet-history",
                "expand-debt",
              ];
              pathname[pathname.length - 1] === "" && pathname.pop();
              if (unauthorizePage.includes(pathname[pathname.length - 1])) {
                navigate("../../authorization");
              }
            }
          }
        } else {
          navigate("../authentication");
        }
      })
      .catch((err) => {
        console.log(err);
        try {
          let pathname = location.pathname.split("/");
          pathname[0] === "" && pathname.shift();
          pathname[pathname.length - 1] === "" && pathname.pop();
          let schoolName = "";
          if (typeof localStorage !== "undefined") {
            try {
              schoolName = window.localStorage.getItem("school") || "";
            } catch (error) {
              console.log(error);
            }
          }
          // console.log(pathname);
          if (schoolName !== "" && schoolName !== null) {
            if (redirect.current === 0) {
              navigate(
                `../login/${schoolName
                  .toLowerCase()
                  .replace(/ /g, "-")}?redirect=${window.location.href}`
              );
              redirect.current = 1;
            }
          } else {
            if (redirect.current === 0) {
              navigate(`../login?redirect=${window.location.href}`);
              redirect.current = 1;
            }
          }
        } catch (error) {
          console.log(error);
        }
      });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [document.readyState]);

  // eslint-disable-next-line react-hooks/exhaustive-deps
  useEffect(() => {
    if (typeof localStorage !== "undefined") {
      try {
        if (window.window.localStorage.getItem("collapseNav")) {
          let colNav =
            window.window.localStorage.getItem("collapseNav") === "true"
              ? true
              : false;
          setCollapseNav(colNav);
        }
      } catch (error) {
        console.log(error);
      }
    }
    if (loggedSchool !== "") {
      let pathname = location.pathname.split("/");

      pathname[0] === "" && pathname.shift();
      let path_arr = pathname[0];

      path_arr !== loggedSchool.replace(/ /g, "_") && navigate("not-found");
    }
  });

  useEffect(() => {
    // Make an API call to get the image data from the server
    fetch(`${url}/main/image`, {
      credentials: "include",
      method: "GET",
    })
      .then((response) => response.json())
      .then((buffer) => {
        if (buffer.status) {
          // console.log()
          if (buffer.image["data"].length > 0) {
            const base64String = Buffer.from(buffer.image).toString("base64");

            const imageUrl = `data:image/jpeg;base64,${base64String}`;
            setLogo(imageUrl);
          }
        }
        // Convert the binary data to a data URL
      })
      .catch((err) => {
        console.log(err);
      });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  });
  const handleLogout = () => {
    notifications.confirm("Are you sure you want to logout?", () => {
      fetch(`${url}/logout`, {
        credentials: "include",
        headers: {
          "Content-Type": "application/json",
        },
        method: "GET",
      })
        .then((res) => res.json())
        .then((data) => {
          if (data.status && data.logout) {
            if (customLogin !== "" && customLogin.startsWith("/")) {
              navigate(
                `../login/${loggedSchool.toLowerCase().replace(/ /g, "-")}`
              );
            } else {
              navigate(
                `../login/${loggedSchool.toLowerCase().replace(/ /g, "-")}`
              );
            }
          }
        })
        .catch((err) => console.log(err));
    });
  };
  const setCollapseNavFnc = () => {
    if (typeof localStorage !== "undefined") {
      try {
        window.window.localStorage.setItem("collapseNav", !collapseNav);
      } catch (error) {
        console.log(error);
      }
    }
    setCollapseNav(!collapseNav);
  };
  return (
    <div className="home">
      <MainContext.Provider
        value={{
          loggedSchool,
          loggedUser,
          admin,
          url,
          notifications,
          io,
          setNotiNum,
          logo,
        }}
      >
        <div className="connection-container" ref={connectionAlert}>
          {isConnected ? <RiWifiLine size={17} /> : <RiWifiOffLine size={17} />}
          <span id="conn"></span>
        </div>
        <div className="noti-cont">
          <Toast ref={toastRef} />
        </div>

        <div
          className={collapseNav ? "vert__nav collapse-vert-nav" : "vert__nav"}
        >
          <div className="custom-toast">
            <Toaster
              position="top-center"
              containerStyle={{ zIndex: "300 !important" }}
            />
            <ConfirmDialog />
          </div>
          <div className="slogan">
            <RiUser4Line size={40} title={loggedUser + " logged in"} />
            <p>Admin Fee Record</p>
          </div>
          <span className="collapse-icon" onClick={() => setCollapseNavFnc()}>
            {!collapseNav ? (
              <RiMenu3Fill size={25} />
            ) : (
              <RiArrowDropRightLine size={30} />
            )}
          </span>
          <nav>
            <NavLink
              to="dashboard"
              className={
                location.pathname ===
                  "/" + loggedSchool.replace(/ /g, "_") + "/" && "active"
              }
            >
              <RiDashboardLine title={collapseNav ? "Dashboard" : ""} />
              <span>Dashboard</span>
            </NavLink>
            <NavLink to="students">
              <RiFileUserLine title={collapseNav ? "Students" : ""} />
              <span> Students</span>
            </NavLink>
            <NavLink to="payment">
              <RiMoneyCnyCircleLine title={collapseNav ? "Make Payment" : ""} />
              <span>Make Payment</span>
            </NavLink>
            <NavLink to="fees">
              <RiExchangeLine title={collapseNav ? "Fees" : ""} />
              <span>Fees</span>
            </NavLink>
            <NavLink to="records">
              <RiDatabaseLine title={collapseNav ? "Records" : ""} />
              <span>Records</span>
            </NavLink>
            <NavLink to="debtors">
              <RiCalendar2Line title={collapseNav ? "Debtors" : ""} />

              <span>Debtors</span>
            </NavLink>
            {admin && (
              <>
                <NavLink to="wallet">
                  <RiWalletLine title={collapseNav ? "Wallet" : ""} />
                  <span>Wallet</span>
                </NavLink>
                <NavLink to="users" className="admin">
                  <RiUserAddLine title={collapseNav ? "Users" : ""} />
                  <span>Users</span>
                </NavLink>
                <NavLink to="settings" className="admin">
                  <RiSettings3Line title={collapseNav ? "Settings" : ""} />
                  <span>Settings</span>
                </NavLink>
                <NavLink to="backup" className="admin">
                  <RiDeviceLine title={collapseNav ? "Backup" : ""} />
                  <span>Backup</span>
                </NavLink>
              </>
            )}
          </nav>
        </div>
        <header className={collapseNav ? "collapse-vert-header" : ""}>
          <Image src={logo} alt="logo" preview />
          <h4 className="school-name">{loggedSchool}</h4>
          <button
            onClick={() => handleLogout()}
            className="phone"
            aria-label="logout"
          >
            <RiLogoutCircleRLine style={{ marginLeft: ".3rem" }} size={21} />
          </button>
          <div className="user">
            {/* <Avatar label={loggedUser[0]} size="large" /> */}
            {notiNum !== "" && (
              <Badge value={notiNum} severity="danger"></Badge>
            )}

            <SplitButton
              // icon="pi pi-user"
              severity="secondary"
              size="small"
              title={loggedUser + " logged in"}
              label={loggedUser.toUpperCase()[0]}
              // onClick={}
              className="p-button-secondary p-button-outlined p-overlay-badge"
              model={[
                {
                  label: "Edit profile",
                  icon: "pi pi-user-edit",
                  command: () => navigate("profile"),
                },
                {
                  label: "Notifications",
                  icon:
                    notiNum !== ""
                      ? "pi pi-envelope p-overlay-badge"
                      : "pi pi-envelope",

                  command: () => navigate("notifications"),
                },
                {
                  label: "Logout",
                  icon: "pi pi-power-off",
                  command: () => handleLogout(),
                },
              ]}
            ></SplitButton>
            {/* <small>{loggedUser}</small> */}
          </div>
        </header>
        <div className="hor-nav">
          <nav>
            <NavLink
              to="dashboard"
              className={
                location.pathname ===
                  "/" + loggedSchool.replace(/ /g, "_") + "/" &&
                "active".concat(" noselect")
              }
            >
              <RiDashboardLine size={20} />
            </NavLink>
            <NavLink to="students" className="noselect">
              <RiFileUserLine size={20} />
            </NavLink>
            <NavLink to="payment" className="noselect">
              <RiMoneyCnyCircleLine size={20} />
            </NavLink>
            <NavLink to="fees" className="noselect">
              <RiExchangeLine size={20} />
            </NavLink>
            <NavLink to="records" className="noselect">
              <RiDatabaseLine size={20} />
            </NavLink>
            <NavLink to="debtors" className="noselect">
              <RiCalendar2Line size={20} />
            </NavLink>
            <NavLink to="profile" className="noselect">
              <RiUserSettingsLine size={20} />
              {/* <i className="pi pi-user-edit svg" style={{ fontSize: 20 }} /> */}
            </NavLink>
            {admin && (
              <>
                <NavLink to="wallet" className="admin noselect">
                  <RiWalletLine title={collapseNav ? "Wallet" : ""} size={20} />
                </NavLink>
                <NavLink to="users" className="admin noselect">
                  <RiUserAddLine size={20} />
                </NavLink>
                <NavLink to="settings" className="admin noselect">
                  <RiSettings3Line size={20} />
                </NavLink>
                <NavLink to="backup" className="admin noselect">
                  <RiDeviceLine size={20} />
                </NavLink>
              </>
            )}
            <NavLink to="notifications" className="noselect p-overlay-badge">
              <RiNotification2Line size={20} />
              {notiNum !== "" && (
                <Badge
                  value={notiNum}
                  severity="danger"
                  style={{ transform: "scale(.8)" }}
                ></Badge>
              )}
            </NavLink>
          </nav>
        </div>
        <main
          className={collapseNav ? "content collapse-vert-content" : "content"}
        >
          <Suspense fallback={<Loader />}>
            <Outlet />
          </Suspense>
          <ScrollTop
            target="parent"
            threshold={100}
            className="w-2rem border-round"
            icon="pi pi-arrow-up text"
            style={{
              transform: "scale(.8)",
              color: "black",
              background: "rgba(0,0,0,0.3)",
            }}
          />
        </main>
      </MainContext.Provider>
    </div>
  );
};

export default Main;
