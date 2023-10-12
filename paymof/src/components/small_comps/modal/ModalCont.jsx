/* eslint-disable react/prop-types */
import { Button } from "primereact/button";
import "./modal.css";
import { useEffect } from "react";
// import toast, {Toaster} from 'react-hot-toast';

const ModalCont = ({
  children,
  title,
  save,
  classModal,
  btn,
  loading,
  notShowSave,
}) => {
  let closeModal = () => {
    document
      .getElementsByClassName(classModal)[0]
      .classList.remove("show-modal");
    document.body.style.overflow = "auto";
    document.body.style.top = "";
  };
  useEffect(() => {
    document.addEventListener("keydown", (e) => {
      let isdisplay;
      try {
        isdisplay = getComputedStyle(
          document.querySelector("." + classModal || "__modal-container")
        ).display;
        if (isdisplay === "flex" && e.key.toLowerCase().trim() === "escape") {
          document
            .querySelector("." + classModal)
            .classList.remove("show-modal");
          document.body.style.overflow = "auto";
          document.body.style.top = "";
        }
        // eslint-disable-next-line no-empty
      } catch (error) {}
    });
  }, [classModal]);
  return (
    <div className={"__modal-container " + classModal}>
      {/* <div><Toaster position="top-center" reverseOrder={false}/></div> */}
      <div className="modal-body">
        <div className="header">
          <h4 className="title h3">{title}</h4>
        </div>
        <div className="content">{children}</div>
        <footer>
          <div className="btn-cont">
            <Button
              onClick={() => closeModal()}
              icon="pi pi-times"
              size="small"
              severity="danger"
              label="Close"
            ></Button>
            {!notShowSave && (
              <Button
                icon="pi pi-check"
                onClick={() => save()}
                loading={loading}
                label={btn ? btn : "Save"}
                severity="success"
                size="small"
              />
            )}
          </div>
        </footer>
      </div>
    </div>
  );
};

export default ModalCont;
