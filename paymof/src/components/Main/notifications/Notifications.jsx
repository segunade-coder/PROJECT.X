import { useContext, useEffect, useId, useState } from "react";
import "./notifications.css";
import { MainContext } from "../Helpers/Context";
import { RiNotification3Fill } from "react-icons/ri";
import toast, { Toaster } from "react-hot-toast";
import { Link } from "react-router-dom";

const Notifications = () => {
  let { url, setNotiNum, notifications, loggedUser } = useContext(MainContext);
  const [noti, setNoti] = useState([]);

  const [isLoading, setIsLoading] = useState(false);
  let uniqueId = useId();
  const formatDate = (rawDate) => {
    let date = new Date(rawDate);
    return [
      date.getDate() < 10 ? `0${date.getDate()}` : date.getDate(),
      date.getUTCMonth() + 1 < 10
        ? `0${date.getUTCMonth() + 1}`
        : date.getUTCMonth() + 1,
      date.getUTCFullYear(),
    ].join("/");
  };
  useEffect(() => {
    setIsLoading(true);
    let uniqid = uniqueId;
    notifications.loading("Loading...", uniqid);
    fetch(`${url}/main/records/notifications?user=${loggedUser}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
    })
      .then((res) => res.json())
      .then((data) => {
        toast.dismiss(uniqid);
        setIsLoading(false);
        if (data.status) setNoti(data.message);
      })
      .catch((err) => {
        toast.dismiss(uniqid);
        setIsLoading(false);
        console.log(err);
      });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    setNotiNum("");
    // eslint-disable-next-line react-hooks/exhaustive-deps
  });
  let removeNoti = (id) => {
    if (id) {
      let uniqid = uniqueId;
      notifications.loading("Deleting...", uniqid);
      fetch(`${url}/main/records/deleteNoti?id=${id}`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
      })
        .then((res) => res.json())
        .then((data) => {
          toast.dismiss(uniqid);
          if (data.status) {
            notifications.success(data.message, uniqueId);
            setNoti(noti.filter((notifi) => notifi.id !== id));
          } else {
            notifications.warning(data.message, uniqueId);
          }
        })
        .catch((err) => {
          notifications.warning("Something went wrong", uniqueId);
          console.log(err);
          toast.dismiss(uniqid);
        });
    }
  };
  return (
    <div className="__notifications">
      <h2>Notifications</h2>
      <div>
        <Toaster position="top-center" reverseOrder={false} />
      </div>

      <div className="notification__container">
        {isLoading ? (
          <div>Loading...</div>
        ) : noti.length === 0 ? (
          <div>No Notifications yet!</div>
        ) : (
          noti.map((notification) => (
            <div
              key={notification.payment_id + Math.random()}
              className={
                notification.status === "1"
                  ? "alert alert-secondary noti__cont seen"
                  : "alert alert-primary noti__cont not-seen"
              }
            >
              <div
                className="close"
                onClick={() => removeNoti(notification.id)}
              >
                <i
                  className="pi pi-trash"
                  style={{ color: "#EE4444", cursor: "pointer" }}
                ></i>
                {/* <RiDeleteBin3Fill fill="red" /> */}
              </div>
              <div className="title alert-heading h6">
                {" "}
                <RiNotification3Fill />
                {notification.title}
              </div>
              <div className="body alert-body">
                <div className="content">
                  {notification.text}{" "}
                  <Link to={`../fees?id=${notification.payment_id}`}>
                    See more
                  </Link>
                </div>
              </div>
              <div style={{ textAlign: "right" }}>
                <small>
                  {formatDate(notification.created_at)}
                  &nbsp;{" "}
                </small>
              </div>
            </div>
          ))
        )}
      </div>
    </div>
  );
};

export default Notifications;
