import { useContext, useEffect, useId, useState } from "react";
import "./Backup.css";
import { MainContext } from "../Helpers/Context";
import toast, { Toaster } from "react-hot-toast";

const Backup = () => {
  let { url, loggedSchool } = useContext(MainContext);
  const [backupDate, setBackupDate] = useState("");
  const [refreshBackup, setrefreshBackup] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  let uniqueId = useId();
  useEffect(() => {
    fetch(`${url}/main/settings/backup-record`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
    })
      .then((res) => res.json())
      .then((data) => {
        if (data?.status) {
          setBackupDate(data?.message[0]?.backup_date);
          setrefreshBackup(false);
        }
      })
      .catch((err) => {
        console.log(err);
      });
  }, [url, refreshBackup, isLoading]);
  let backup = () => {
    setIsLoading(true);
    let uniqid = uniqueId;
    toast.loading("loading...", { id: uniqid });
    fetch(`${url}/main/settings/backup`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
    })
      .then((res) => res.json())
      .then((data) => {
        setIsLoading(false);
        toast.dismiss(uniqid);
        if (data?.status) {
          toast.success(data?.message);
          setrefreshBackup(true);
        } else {
          toast.error(data.message);
        }
      })
      .catch((err) => {
        setIsLoading(false);
        toast.dismiss(uniqid);
        console.log(err);
      });
  };
  return (
    <div className="__backup">
      <h2>Backup Database</h2>
      <div>
        <Toaster position="top-center" reverseOrder={false} />
      </div>
      <div className="container alert alert-warning backup-cont">
        <div className="h6">
          <b>{loggedSchool}</b>
        </div>
        <p>
          <small>
            last backup:{" "}
            {backupDate !== ""
              ? new Date(backupDate)?.toLocaleDateString()
              : "Nil"}
          </small>
        </p>
      </div>
      <div className="btn-cont">
        <button
          className="btn btn-primary btn-sm mt-2"
          onClick={backup}
          disabled={isLoading}
        >
          Backup
        </button>
      </div>
    </div>
  );
};

export default Backup;
