import { useContext, useEffect, useRef, useId, useState } from "react";
import { RiCloseFill, RiDeleteBin4Fill, RiSaveLine } from "react-icons/ri";
import ModalCont from "../../small_comps/modal/ModalCont";
import "./users.css";
import { MainContext } from "../Helpers/Context";
import toast, { Toaster } from "react-hot-toast";
const Users = () => {
  const [username, setUsername] = useState("");
  const [pass, setPass] = useState("");
  const [users, setUsers] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const dataFetchedRef = useRef(false);
  let { loggedSchool, url, loggedUser, notifications } =
    useContext(MainContext);
  let uniqueId = useId();
  const fetchData = () => {
    let uniqid = uniqueId;
    notifications.loading("Loading...", uniqid);
    setIsLoading(true);
    fetch(`${url}/main/users`, { credentials: "include" })
      .then((res) => res.json())
      .then((data) => {
        toast.dismiss(uniqid);
        if (data.status) {
          setUsers(data.data);
          console.log(loggedUser);
          setUsers(data["data"].filter((user) => user.id !== 1));
        }

        setIsLoading(false);
      })
      .catch((err) => {
        toast.dismiss(uniqid);
        setIsLoading(false);
        console.log(err);
      });
  };
  useEffect(() => {
    if (dataFetchedRef.current) return;
    dataFetchedRef.current = true;
    fetchData();
  });
  let addUser = () => {
    if (username === "" || pass === "") {
      notifications.warning("Each field must be filled out", uniqueId);
    } else {
      if (username.length <= 2 || pass.length <= 2) {
        notifications.warning(
          "Username or password must be greater than two",
          uniqueId
        );
      } else {
        let added = {
          school: loggedSchool,
          user: username,
          password: pass,
          last_login: "",
          status: 1,
        };
        let uniqid = uniqueId;
        notifications.loading("Adding user...", uniqid);
        fetch(`${url}/main/users/add`, {
          credentials: "include",
          headers: {
            "Content-Type": "application/json",
          },
          method: "POST",
          body: JSON.stringify({
            username,
            pass,
            loggedSchool,
          }),
        })
          .then((res) => res.json())
          .then((data) => {
            toast.dismiss(uniqid);
            data.status
              ? notifications.success(data.message, uniqueId)
              : notifications.warning(data.message, uniqueId);
            data.status &&
              document
                .getElementsByClassName("user-modal")[0]
                .classList.remove("show-modal");
            data.status && setUsers([...users, added]);
            data.status && fetchData();
            document.body.style.overflow = "auto";
            document.body.style.top = "";
          })
          .catch((err) => {
            toast.dismiss(uniqid);
            notifications.warning("Error: Failed to add user", uniqueId);
            console.log(err);
          });
      }
    }
  };
  let editActivation = (id, status, action) => {
    status === 0 ? (status = 1) : (status = 0);
    let tempArr = users;
    notifications.confirm(
      `Do you want to ${action} this account`,
      () => {
        tempArr.forEach((elem) => {
          if (elem.id === id) {
            elem.status = status;
          }
        });
        let uniqid = uniqueId;
        notifications.loading("Editing user...", uniqid);
        console.log(id);
        fetch(`${url}/main/users/edit`, {
          credentials: "include",
          headers: {
            "Content-Type": "application/json",
          },
          method: "POST",
          body: JSON.stringify({
            id,
            status,
          }),
        })
          .then((res) => res.json())
          .then((data) => {
            toast.dismiss(uniqid);
            if (data.status) {
              notifications.success(data.message, uniqueId);
              setUsername("add");
              setUsers(tempArr);
              setPass("");
            } else {
              notifications.warning(data.message, uniqueId);
            }
          })
          .catch((err) => {
            toast.dismiss(uniqid);
            notifications.warning("Error: Failed to edit.", uniqueId);
            console.log(err);
          });
      },
      () => {},
      [id, status, action]
    );
  };
  let deleteUser = (id, userAcc) => {
    notifications.confirmDelete(
      `Do you want to delete ${userAcc} from users?`,
      () => {
        let uniqid = uniqueId;
        notifications.loading("Deleting...", uniqid);
        fetch(`${url}/main/users/delete-user`, {
          credentials: "include",
          headers: {
            "Content-Type": "application/json",
          },
          method: "POST",
          body: JSON.stringify({
            id,
          }),
        })
          .then((res) => res.json())
          .then((data) => {
            toast.dismiss(uniqid);
            if (data.status) {
              notifications.success(data.message, uniqueId);
              setUsers(users.filter((user) => user.id !== id));
            } else {
              notifications.warning(data.message, uniqueId);
            }
          })
          .catch((err) => {
            toast.dismiss(uniqid);
            notifications.warning("Error: Failed to delete", uniqueId);
            console.log(err);
          });
      },
      () => {},
      [id, userAcc]
    );
  };
  let showModal = () => {
    setUsername("");
    setPass("");
    document
      .getElementsByClassName("user-modal")[0]
      .classList.add("show-modal");
    document.body.style.overflow = "hidden";
    window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
  };
  let makeAdmin = (id, name) => {
    notifications.confirm(
      `Make ${name} an admin?`,
      () => {
        if (id) {
          let uniqid = uniqueId;
          notifications.loading("Loading...", uniqid);
          fetch(`${url}/main/users/add-admin`, {
            credentials: "include",
            headers: {
              "Content-Type": "application/json",
            },
            method: "POST",
            body: JSON.stringify({
              id,
            }),
          })
            .then((res) => res.json())
            .then((data) => {
              toast.dismiss(uniqid);
              if (data.status) {
                notifications.success(data.message, uniqueId);
              } else {
                notifications.warning(data.message, uniqueId);
              }
            })
            .catch((err) => {
              toast.dismiss(uniqid);
              notifications.warning("Operation failed", uniqueId);
              console.log(err);
            });
        }
      },
      () => {},
      [id, name]
    );
  };
  return (
    <div className="__users">
      <div>
        <Toaster position="top-center" reverseOrder={false} />
      </div>

      <h2>Users</h2>
      <div className="add-btn">
        <button onClick={() => showModal()}>
          <i className="pi pi-user-plus" style={{ fontSize: "1.2rem" }}></i>
        </button>
      </div>
      <table border={1} className="table table-responsive">
        <thead>
          <tr>
            <th>Name</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {isLoading ? (
            <tr>
              <td colSpan={3}>loading...</td>
            </tr>
          ) : users.length === 0 ? (
            <tr>
              <td>No user available</td>
            </tr>
          ) : (
            users.map((user) => (
              <tr key={user.user + user.password + new Date() + Math.random()}>
                <td>{user.user}</td>
                <td>
                  <div className="d-flex align-items-center">
                    {" "}
                    {user.status === 1 ? "active" : "disabled"}{" "}
                    <i
                      style={{
                        color: user.status === 1 ? "green" : "red",
                        marginLeft: ".5rem",
                      }}
                      className="pi pi-verified"
                    ></i>
                  </div>
                </td>
                <td>
                  <div className="action-cont">
                    {user.status === 0 && (
                      <div
                        onClick={() =>
                          editActivation(user.id, user.status, "activate")
                        }
                      >
                        <span>activate</span> <RiSaveLine fill="green" />{" "}
                      </div>
                    )}
                    {user.status === 1 && (
                      <div
                        onClick={() =>
                          editActivation(user.id, user.status, "disable")
                        }
                      >
                        <span>disable</span>
                        <RiCloseFill fill="red" />{" "}
                      </div>
                    )}
                    <div onClick={() => makeAdmin(user.id, user.user)}>
                      <i
                        className="pi pi-users"
                        style={{ fontSize: "1.2rem" }}
                      ></i>
                      <i
                        className="pi pi-users pi-plus"
                        style={{ fontSize: ".5rem" }}
                      ></i>
                      <i
                        className="pi pi-users pi-plus"
                        style={{ fontSize: ".5rem", marginTop: "-5px" }}
                      ></i>
                    </div>
                    <div onClick={() => deleteUser(user.id, user.user)}>
                      {" "}
                      <span>delete</span>
                      <RiDeleteBin4Fill fill="red" />{" "}
                    </div>
                  </div>
                </td>
              </tr>
            ))
          )}
        </tbody>
      </table>
      <ModalCont title="Add User" classModal="user-modal" save={addUser}>
        <div className="inputs-container">
          <form>
            <div className="input-cont">
              <label htmlFor="username">Username</label>
              <input
                type="text"
                id="username"
                value={username}
                autoComplete="on"
                onChange={(e) => setUsername(e.target.value)}
              />
            </div>
            <div className="input-cont">
              <label htmlFor="pass">Password</label>
              <input
                type="password"
                id="pass"
                value={pass}
                autoComplete="on"
                onChange={(e) => setPass(e.target.value)}
                maxLength={10}
              />
            </div>
          </form>
        </div>
      </ModalCont>
    </div>
  );
};

export default Users;
