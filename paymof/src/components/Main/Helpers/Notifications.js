import toast from "react-hot-toast";
import { confirmDialog } from "primereact/confirmdialog";
const confirm = (
  msg = "Are you sure you want to delete?",
  accept,
  reject = () => {},
  param = []
) => {
  confirmDialog({
    message: msg,
    header: "Confirmation",
    icon: "pi pi-info-circle",
    accept: () => accept(...param),
    reject,
  });
};
const confirmDelete = (
  msg = "Are you sure you want to delete?",
  accept,
  reject,
  param = []
) => {
  confirmDialog({
    message: msg,
    header: "Delete Confirmation",
    icon: "pi pi-info-circle",
    acceptClassName: "p-button-danger",
    accept: () => accept(...param),
    reject,
  });
};
let warning = (msg, id = "") => {
  toast.error(msg, { id: id });
};
let success = (msg, id = "") => {
  toast.success(msg, { id: id });
};
let loading = (msg = "Loading...", id = "") => {
  toast.loading(msg, { id: id });
};
let url = "http://localhost:5000";
// let url = "http://192.168.137.8:5000";
// let url = "";
let notifications = {
  warning,
  success,
  loading,
  confirmDelete,
  confirm,
  url,
};
export default notifications;
