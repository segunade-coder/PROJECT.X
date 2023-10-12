import { useContext, useState } from "react";
import { MainContext } from "../Helpers/Context";
import { Button } from "primereact/button";
import { Ripple } from "primereact/ripple";
import { Password } from "primereact/password";

const Profile = () => {
  let { loggedUser, url, notifications, loggedSchool } =
    useContext(MainContext);
  const [oldPassword, setOldPassword] = useState("");
  const [newPassword, setNewPassword] = useState("");

  let changePassword = (e) => {
    e.preventDefault();
    if (oldPassword === "" || newPassword === "") {
      notifications.warning("Fill in necessary fields", "ssnsks");
      return;
    }
    if (oldPassword.trim().toLowerCase() === newPassword.trim().toLowerCase()) {
      notifications.warning("Passwords are the same", "ssnsks");
      return;
    }
    fetch(`${url}/main/dashboard/change-password`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
      body: JSON.stringify({
        user: loggedUser.toLowerCase().trim(),
        school: loggedSchool.toLowerCase().trim(),
        oldPassword: oldPassword.trim().toLowerCase(),
        newPassword: newPassword.trim().toLowerCase(),
      }),
    })
      .then((res) => res.json())
      .then((data) => {
        if (data.status) {
          notifications.success(data.message, "ssnsks");
          setOldPassword("");
          setNewPassword("");
        } else {
          notifications.warning(data.message, "ssnsks");
        }
      })
      .catch((error) => {
        console.log(error);
        notifications.warning("Failed to change password.", "ssnsks");
      });
  };
  return (
    <div>
      <h2 className="h2">Profile Page</h2>
      <b className="text" style={{ textTransform: "capitalize" }}>
        {loggedUser}
      </b>

      <h4 className="h4 text mt-5">Change Password</h4>
      <form action="">
        <Password
          value={oldPassword}
          onChange={(e) => setOldPassword(e.target.value)}
          className="mb-2"
          toggleMask
          placeholder="Enter old password"
          feedback={false}
        />
        <br />
        <Password
          value={newPassword}
          onChange={(e) => setNewPassword(e.target.value)}
          className="mb-3"
          toggleMask
          placeholder="Enter a new password"
          promptLabel="Choose a new password"
          weakLabel="Too simple"
          mediumLabel="Average complexity"
          strongLabel="Complex password"
        />
        <br />
        <Button
          icon="pi pi-check-circle"
          label="Submit"
          onClick={(e) => changePassword(e)}
        >
          <Ripple />
        </Button>
      </form>
    </div>
  );
};

export default Profile;
