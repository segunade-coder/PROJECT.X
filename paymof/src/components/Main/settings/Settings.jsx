import { useContext, useEffect, useState, useRef, useId } from "react";
import { MainContext } from "../Helpers/Context";
import "./settings.css";
import ModalCont from "../../small_comps/modal/ModalCont";
import toast, { Toaster } from "react-hot-toast";
// import { ColorPicker, useColor } from "react-color-palette";
import { ColorPicker } from "primereact/colorpicker";
import "react-color-palette/lib/css/styles.css";
import { InputNumber } from "primereact/inputnumber";
import { Button } from "primereact/button";
import { Ripple } from "primereact/ripple";
import { Dropdown } from "primereact/dropdown";
import { Image } from "primereact/image";
import { SplitButton } from "primereact/splitbutton";

const Settings = () => {
  let { loggedSchool, url, notifications, logo } = useContext(MainContext);
  const [classes, setClasses] = useState([]);
  const [newLogo, setNewLogo] = useState(null);
  const [previewImage, setPreviewImage] = useState(logo);
  const [currentSession, setCurrentSession] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [currentTerm, setCurrentTerm] = useState("");
  const [currentFee, setCurrentFee] = useState("");
  const [newFee, setNewFee] = useState("0");
  const [newClass, setNewClass] = useState("");
  const [fees, setFees] = useState([]);
  const [feeEdit, setFeeEdit] = useState([]);
  const [deleteClass, setDeleteClass] = useState("");
  const [sessionArray, setSessionArray] = useState([]);
  const [paymentMethodArr, setPaymentMethodArr] = useState([]);
  const [paymentMethod, setPaymentMethod] = useState("");
  const [paymentForArr, setPaymentForArr] = useState([]);
  const [paymentFor, setPaymentFor] = useState("");
  const [termArray, setTermArray] = useState([]);
  const [newFeeName, setNewFeeName] = useState("");
  const [newFeeAdd, setNewFeeAdd] = useState("");
  const [updateClass, setUpdateClass] = useState("");
  const [isLoading2, setIsLoading2] = useState(false);
  const [loadImageChange, setLoadImageChange] = useState(false);
  const [uploadText, setUploadText] = useState("Click to upload image");
  const dataFetchedRef = useRef(false);
  const [dropdownClass, setDropdownClass] = useState([]);
  const [bgcolor, setBgColor] = useState(
    getComputedStyle(document.documentElement).getPropertyValue("--mainBgColor")
  );
  const [autoImportStatus, setAutoImportStatus] = useState(false);
  const [selectChangeAppearance, setSelectChangeAppearance] =
    useState("background");
  let uniqueId = useId();
  const fetchData = () => {
    setIsLoading(true);
    let uniqid = uniqueId;
    fetch(`${url}/main/settings?school=${loggedSchool?.replace(/ /g, "-")}`, {
      credentials: "include",
    })
      .then((res) => res?.json())
      .then((data) => {
        //  console.log(data);
        let classes1 = JSON.parse(data?.message[0]?.classes);
        let testClass = JSON.parse(data?.message[0].classes);
        let testTerm = data?.message[0]?.terms?.split(",");
        let testSession = data?.message[0]?.sessions?.split(",");
        let testPaymentMethod = data?.message[0]?.payment_method?.split(",");
        let testPaymentFor = data?.message[0]?.payment_for?.split(",");
        let normalClass = [];
        let setClass = async () => {
          testClass = await testClass.map((classe) => {
            return { name: classe.toUpperCase() };
          });
          normalClass = await classes1.map((classe) => {
            return classe.toUpperCase();
          });
          testTerm = await testTerm.map((term) => {
            return term.toUpperCase();
          });
          testSession = await testSession.map((sess) => {
            return sess.toUpperCase();
          });
          testPaymentMethod = await testPaymentMethod.map((pm) => {
            return pm.toUpperCase();
          });
          testPaymentFor = await testPaymentFor.map((pf) => {
            return pf.toUpperCase();
          });
          return {
            testClass,
            normalClass,
            testTerm,
            testSession,
            testPaymentMethod,
            testPaymentFor,
          };
        };
        // setClasses(setClass().then((data) => data));
        setClass().then(
          ({
            testClass,
            normalClass,
            testTerm,
            testSession,
            testPaymentMethod,
            testPaymentFor,
          }) => {
            setDropdownClass(testClass);
            setClasses(normalClass);
            setTermArray(testTerm);
            setSessionArray(testSession);
            setPaymentMethodArr(testPaymentMethod);
            setPaymentForArr(testPaymentFor);
          }
        );
        setCurrentSession(data?.message[0]?.current_session);
        setCurrentTerm(data?.message[0]?.current_term?.toUpperCase());
        setFees(new Map(JSON?.parse(data?.message[0]?.fees)));
        // setClasses(JSON?.parse(classes1));
        // setClasses(classes.map(clas => clas.toUpperCase))
        setIsLoading(false);
        // console.log(classes);
      })
      .catch((err) => {
        // toast.dismiss(uniqid);
        notifications.warning("Error: Failed to fetch data", uniqid);
        setIsLoading(false);
        console.log(err);
      });
  };

  useEffect(() => {
    if (dataFetchedRef.current) return;
    dataFetchedRef.current = true;
    fetchData();
  });
  let saveRequest = (data, updateName, id = "") => {
    setIsLoading2(true);
    let uniqid = uniqueId;
    notifications.loading("Loading...", uniqid);
    fetch(`${url}/main/settings/save`, {
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
      },
      method: "POST",
      body: JSON?.stringify({
        data: Array?.from(data),
        name: updateName,
      }),
    })
      .then((res) => res.json())
      .then((data) => {
        // toast.dismiss(uniqid);
        setIsLoading2(false);
        if (data?.status) {
          notifications?.success(data.message, uniqueId);
          if (id !== "") {
            document
              ?.getElementsByClassName(`${id}`)[0]
              ?.classList?.remove("show-modal");
            document.body.style.overflow = "auto";
            document.body.style.top = "";
          }
        } else {
          notifications?.warning(data.message, uniqueId);
        }
      })
      .catch((err) => {
        // toast.dismiss(uniqid);
        notifications.warning("Error: Operation failed", uniqueId);
        setIsLoading2(false);
        console.log(err);
      });
  };
  let saveFees = () => {
    if (newFee === "" || parseInt(currentFee) === parseInt(newFee)) {
      if (parseInt(currentFee) === parseInt(newFee)) {
        notifications.loading("Amount are the same", "mena");
        return;
      }
      notifications.loading("Empty Amount", "mena");
    } else {
      let tempSet = fees.set(feeEdit, newFee);
      saveRequest(fees, "fees", "one");
      setFees(tempSet);
      setNewFee("");
    }
  };
  let saveNewFee = () => {
    if (newFeeAdd === "" || newFeeName === "") {
      notifications.warning("Enter necessary fields", "hhfki");
      return;
    } else {
      try {
        let tempSet = fees.set(newFeeName?.toLowerCase()?.trim(), newFeeAdd);
        saveRequest(fees, "fees", "add-fee");
        setFees(tempSet);
        setNewFeeName("");
        setNewFeeAdd("");
      } catch (error) {
        console.log(error);
      }
    }
  };
  let uploadLogo = (e) => {
    e.preventDefault();
    if (newLogo === null) {
      notifications.warning("Upload an image!", "this");
      return;
    } else {
      let formData = new FormData();
      formData.append("image", newLogo);
      notifications.loading("Uploading...", "this");
      fetch(`${url}/main/settings/upload-logo`, {
        credentials: "include",
        method: "POST",
        body: formData,
      })
        .then((res) => res.json())
        .then((data) => {
          // toast.dismiss(uniqid);
          if (data?.status) {
            notifications?.success(data.message, "this");
          } else {
            notifications?.warning(data.message, "this");
          }
        })
        .catch((err) => {
          // toast.dismiss(uniqid);
          notifications.warning("Error: Failed to upload", "this");
          console.log(err);
        });
    }
  };

  const handleImageChange = (event) => {
    setLoadImageChange(true);
    const file = event.target.files[0];
    setUploadText(file.name);

    if (file) {
      setNewLogo(event.target.files[0]);

      const reader = new FileReader();
      reader.onload = () => {
        setPreviewImage(reader.result);
        setLoadImageChange(false);
        console.log("done");
      };
      reader.onerror = () => {
        notifications.warning("Unable to preview Image");
      };
      reader.readAsDataURL(file);
    }
  };

  let saveNewClass = () => {
    if (newClass === "") {
      return;
    } else {
      try {
        saveRequest(
          [
            ...classes.map((cl) => cl?.toLowerCase()),
            newClass?.toLowerCase()?.trim(),
          ],
          "classes",
          "two"
        );
        setClasses([...classes, newClass?.toUpperCase()?.trim()]);
        setNewFee("");
        setNewClass("");
      } catch (error) {
        console.log(error);
      }
    }
  };
  let saveNewSession = () => {
    if (currentSession === "" || sessionArray.includes(currentSession)) {
      return;
    } else {
      saveRequest([...sessionArray, currentSession], "sessions", "three");
      setSessionArray([...sessionArray, currentSession]);
      console.log("get on up");
    }
  };
  let savePaymentMethod = () => {
    if (paymentMethod === "" || paymentMethodArr.includes(paymentMethod)) {
      return;
    } else {
      saveRequest(
        [...paymentMethodArr, paymentMethod?.toUpperCase()?.trim()],
        "payment_method",
        "four"
      );
      setPaymentMethodArr([
        ...paymentMethodArr,
        paymentMethod?.toLowerCase()?.trim(),
      ]);
    }
  };
  let handleEdit = (id, feeValue) => {
    setCurrentFee(feeValue);
    setFeeEdit(id);
    document.getElementsByClassName("one")[0].classList.add("show-modal");
    document.body.style.overflow = "hidden";
    window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
  };
  let savePaymentFor = () => {
    if (paymentFor === "" || paymentForArr.includes(paymentFor)) {
      return;
    } else {
      saveRequest(
        [...paymentForArr, paymentFor?.toLowerCase()?.trim()],
        "payment_for",
        "five"
      );
      setPaymentForArr([...paymentForArr, paymentFor?.toUpperCase()?.trim()]);

      document.getElementsByClassName("five")[0].classList.remove("show-modal");
      document.body.style.overflow = "auto";
      document.body.style.top = "";
    }
  };
  let saveTerm = () => {
    if (currentTerm === "" || termArray.includes(currentTerm)) {
      return;
    } else {
      saveRequest(
        [...termArray, currentTerm?.toLowerCase()?.trim()],
        "terms",
        "six"
      );
      setTermArray([...termArray, currentTerm?.toUpperCase()?.trim()]);

      document.getElementsByClassName("six")[0].classList.remove("show-modal");
      document.body.style.overflow = "auto";
      document.body.style.top = "";
    }
  };
  let declineDelete = () => {};
  let handleDelete = (arr, id) => {
    if (id !== "") {
      if (arr === "fees") {
        notifications.confirmDelete(
          "Are you sure you want to delete?",
          () => {
            fees.delete(id);
            setNewFee(0);
            saveRequest(fees, arr);
          },
          declineDelete,
          [arr, id]
        );
      } else if (arr === "classes") {
        console.log(arr);
        notifications.confirmDelete(
          "Are you sure you want to " + deleteClass + "?",
          () => {
            saveRequest(
              classes?.filter((elem) => elem !== id),
              arr
            );
            setClasses(classes?.filter((elem) => elem !== id));
            setNewClass("");
            setNewFee(0);
            setDeleteClass("");
          },
          declineDelete,
          [arr, id]
        );
      } else if (arr === "session") {
        notifications.confirmDelete(
          "Are you sure you want to delete?",
          () => {
            saveRequest(
              sessionArray?.filter((elem) => elem !== id),
              "sessions"
            );
            setSessionArray(sessionArray?.filter((elem) => elem !== id));
            setNewFee(0);
          },
          declineDelete,
          [arr, id]
        );
      } else if (arr === "paymentMethod") {
        notifications.confirmDelete(
          "Are you sure you want to delete?",
          () => {
            setPaymentMethodArr(paymentMethodArr.filter((elem) => elem !== id));
            setNewFee(0);
            setPaymentMethod("");
            saveRequest(
              paymentMethodArr.filter((elem) => elem !== id),
              "payment_method"
            );
          },
          declineDelete,
          [arr, id]
        );
      } else if (arr === "paymentFor") {
        notifications.confirmDelete(
          "Are you sure you want to delete?",
          () => {
            setPaymentForArr(paymentForArr.filter((elem) => elem !== id));
            setNewFee(0);
            saveRequest(
              paymentForArr.filter((elem) => elem !== id),
              "payment_for"
            );
            setPaymentFor("");
          },
          declineDelete,
          [arr, id]
        );
      } else if (arr === "term") {
        notifications.confirmDelete(
          "Are you sure you want to delete?",
          () => {
            setTermArray(termArray.filter((elem) => elem !== id));
            setNewFee(0);
            saveRequest(
              termArray.filter((elem) => elem !== id),
              "terms"
            );
          },
          declineDelete,
          [arr, id]
        );
      }
    }
  };
  let changeCurrentSession = (value) => {
    notifications.confirm(
      "Are you sure you want to change current session?",
      () => {
        setCurrentSession(value);
        if (currentSession !== "") {
          setIsLoading2(true);
          let uniqid = uniqueId;
          notifications.loading("Saving...", uniqid);
          fetch(`${url}/main/settings/edit-current-session`, {
            credentials: "include",
            headers: {
              "Content-Type": "application/json",
            },
            method: "POST",
            body: JSON.stringify({
              value,
            }),
          })
            .then((res) => res.json())
            .then((data) => {
              toast.dismiss(uniqid);
              setIsLoading2(false);

              if (data.status) {
                notifications.success(data.message, uniqueId);
                document
                  .getElementsByClassName("five")[0]
                  .classList.remove("show-modal");
                document.body.style.overflow = "auto";
                document.body.style.top = "";
              } else notifications.warning(data.message, uniqueId);
            })
            .catch((err) => {
              setIsLoading2(false);
              toast.dismiss(uniqid);
              notifications.warning("Error: Failed!");
              console.log(err);
            });
        } else {
          notifications.warning("Make a selection", uniqueId);
        }
      },
      declineDelete,
      [value]
    );
  };
  let changeCurrentTerm = (value) => {
    notifications.confirm(
      "Are you sure you want to change current term to" +
        value?.toLowerCase() +
        "?",
      () => {
        let uniqid = uniqueId;
        setCurrentTerm(value);
        if (currentTerm !== "") {
          setIsLoading2(true);
          notifications.loading("Saving...", uniqid);
          fetch(`${url}/main/settings/edit-current-term`, {
            credentials: "include",
            headers: {
              "Content-Type": "application/json",
            },
            method: "POST",
            body: JSON.stringify({
              value,
            }),
          })
            .then((res) => res.json())
            .then((data) => {
              // toast.dismiss(uniqid);
              setIsLoading2(false);

              if (data.status) {
                notifications.success(data.message, uniqid);
                document
                  .getElementsByClassName("five")[0]
                  .classList.remove("show-modal");
                document.body.style.overflow = "auto";
                document.body.style.top = "";
              } else notifications.warning(data.message, uniqid);
            })
            .catch((err) => {
              setIsLoading2(false);
              // toast.dismiss(uniqid);
              notifications.warning("Error: Failed!", uniqid);
              console.log(err);
            });
        } else {
          notifications.warning("Make a selection", uniqid);
        }
      },
      declineDelete,
      [value]
    );
  };
  let handleAdd = (id) => {
    document.getElementsByClassName(id)[0].classList.add("show-modal");
    document.body.style.overflow = "hidden";
    window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
    // document.getElementsByClassName(id)[0].style.height = window.innerHeight + "px";
    // console.log(window.innerHeight)
  };
  let handleAddFee = (id) => {
    document.getElementsByClassName(id)[0].classList.add("show-modal");
    document.body.style.overflow = "hidden";
    window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
    // document.getElementsByClassName(id)[0].style.height = window.innerHeight + "px";
    // console.log(window.innerHeight)
  };
  let editClass = () => {
    if (deleteClass !== "") {
      document
        .getElementsByClassName("update-class")[0]
        .classList.add("show-modal");
      document.body.style.overflow = "hidden";
      window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
    }
  };
  let saveUpdateClass = () => {
    if (updateClass !== "" || deleteClass !== "") {
      let tempArr = [];
      classes?.forEach((class1) => {
        if (class1?.toLowerCase() === deleteClass?.toLowerCase()) {
          class1 = updateClass?.toUpperCase()?.trim();
        }
        tempArr?.push(class1);
      });

      setClasses(tempArr);
      setIsLoading2(true);
      let uniqid = uniqueId;
      notifications.loading("Saving...", uniqid);
      fetch(`${url}/main/settings/update-class`, {
        credentials: "include",
        headers: {
          "Content-Type": "application/json",
        },
        method: "POST",
        body: JSON.stringify({
          prev: deleteClass?.trim()?.toLowerCase(),
          newCls: updateClass?.trim()?.toLowerCase(),
          classes: tempArr,
        }),
      })
        .then((res) => res.json())
        .then((data) => {
          // toast.dismiss(uniqid);
          setIsLoading2(false);

          if (data.status) {
            notifications.success(data.message, uniqid);
            document
              .getElementsByClassName("update-class")[0]
              .classList.remove("show-modal");
            document.body.style.overflow = "auto";
            document.body.style.top = "";
          } else notifications.warning(data.message, uniqid);
        })
        .catch((err) => {
          // toast.dismiss(uniqid);
          notifications.warning("Error: Failed to save.", uniqid);
          setIsLoading2(false);
          console.log(err);
        });
    }
  };
  String.prototype.convertToRGB = function () {
    var aRgbHex = this.match(/.{1,2}/g);
    var aRgb = [
      parseInt(aRgbHex[0], 16),
      parseInt(aRgbHex[1], 16),
      parseInt(aRgbHex[2], 16),
    ];
    return aRgb;
  };
  // function rgb2hsv(r, g, b) {
  //   let rabs, gabs, babs, rr, gg, bb, h, s, v, diff, diffc, percentRoundFn;
  //   rabs = r / 255;
  //   gabs = g / 255;
  //   babs = b / 255;
  //   (v = Math.max(rabs, gabs, babs)), (diff = v - Math.min(rabs, gabs, babs));
  //   diffc = (c) => (v - c) / 6 / diff + 1 / 2;
  //   percentRoundFn = (num) => Math.round(num * 100) / 100;
  //   if (diff == 0) {
  //     h = s = 0;
  //   } else {
  //     s = diff / v;
  //     rr = diffc(rabs);
  //     gg = diffc(gabs);
  //     bb = diffc(babs);

  //     if (rabs === v) {
  //       h = bb - gg;
  //     } else if (gabs === v) {
  //       h = 1 / 3 + rr - bb;
  //     } else if (babs === v) {
  //       h = 2 / 3 + gg - rr;
  //     }
  //     if (h < 0) {
  //       h += 1;
  //     } else if (h > 1) {
  //       h -= 1;
  //     }
  //   }
  //   return {
  //     h: Math.round(h * 360),
  //     s: percentRoundFn(s * 100),
  //     v: percentRoundFn(v * 100),
  //   };
  // }
  let changeAppearance = (e) => {
    setSelectChangeAppearance(e.value);
    let color = "#000000";
    if (e.value === "background") {
      color = getComputedStyle(document.documentElement).getPropertyValue(
        "--mainBgColor"
      );
      setBgColor(color);
    }
    if (e.value === "secondary") {
      color = getComputedStyle(document.documentElement).getPropertyValue(
        "--mainSecondaryColor"
      );
      setBgColor(color);
    }
    if (e.value === "accent") {
      color = getComputedStyle(document.documentElement).getPropertyValue(
        "--mainAccentColor"
      );
      setBgColor(color);
    }
    if (e.value === "text") {
      color = getComputedStyle(document.documentElement).getPropertyValue(
        "--textColor"
      );
      setBgColor(color);
    }
    if (e.value === "secondary-text") {
      color = getComputedStyle(document.documentElement).getPropertyValue(
        "--secondaryTextColor"
      );
      setBgColor(color);
    }
  };
  let UpdateColor = () => {
    let color = "#" + bgcolor;
    if (selectChangeAppearance === "background") {
      document.documentElement.style.setProperty("--mainBgColor", color);
      if (typeof localStorage !== "undefined") {
        try {
          window.localStorage.setItem("background", color);
        } catch (error) {
          console.log(error);
        }
      }
    }
    if (selectChangeAppearance === "secondary") {
      document.documentElement.style.setProperty("--mainSecondaryColor", color);
      if (typeof localStorage !== "undefined") {
        try {
          window.localStorage.setItem("secondary", color);
        } catch (error) {
          console.log(error);
        }
      }
    }
    if (selectChangeAppearance === "accent") {
      document.documentElement.style.setProperty("--mainAccentColor", color);
      if (typeof localStorage !== "undefined") {
        try {
          window.localStorage.setItem("accent", color);
        } catch (error) {
          console.log(error);
        }
      }
    }
    if (selectChangeAppearance === "text") {
      document.documentElement.style.setProperty("--textColor", color);
      if (typeof localStorage !== "undefined") {
        try {
          window.localStorage.setItem("text", color);
        } catch (error) {
          console.log(error);
        }
      }
    }
    if (selectChangeAppearance === "secondary-text") {
      document.documentElement.style.setProperty("--secondaryTextColor", color);
      document.documentElement.style.setProperty("--secondaryTextIcon", color);
      if (typeof localStorage !== "undefined") {
        try {
          window.localStorage.setItem("secondary-text", color);
        } catch (error) {
          console.log(error);
        }
      }
    }
  };
  let autoImportClass = () => {
    setAutoImportStatus(true);
    fetch(`${url}/main/settings/autoimport`, {
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
      },
      method: "GET",
    })
      .then((res) => res.json())
      .then((data) => {
        setAutoImportStatus(false);
        if (data?.status) {
          notifications?.success(data.message);
          fetchData();
        } else {
          notifications?.warning(data.message);
        }
      })
      .catch((err) => {
        notifications.warning("Error: Operation failed");
        setAutoImportStatus(false);
        console.log(err);
      });
  };
  let saveFeeToHistory = () => {
    notifications.loading("Loading.", "hgh");
    fetch(`${url}/main/settings/save-fee-history`, {
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
      },
      method: "POST",
      body: JSON.stringify({
        fees: [...fees],
        current_session: currentSession,
        current_term: currentTerm,
      }),
    })
      .then((res) => res.json())
      .then((data) => {
        if (data?.status) {
          notifications?.success(data.message, "hgh");
        } else {
          notifications?.warning(data.message, "hgh");
        }
      })
      .catch((err) => {
        notifications.warning("Error: Operation failed", "hgh");
        console.log(err);
      });
  };
  return (
    <div className="__settings">
      <div>
        <Toaster position="top-center" reverseOrder={false} />
      </div>

      <h2>Settings</h2>
      <div className="container">
        <div className="classes">
          <h4 className="h4">Upload Logo</h4>
          <div className="upload-logo">
            <div className="card"></div>
            <form onSubmit={uploadLogo}>
              <label htmlFor="logo">{uploadText}</label>
              <input
                type="file"
                style={{ display: "none" }}
                id="logo"
                onChange={handleImageChange}
                accept="image/*"
              />

              <div className="btn-add-cont">
                <Button
                  type="submit"
                  label="Upload"
                  icon="pi pi-check-circle"
                  size="small"
                  severity="secondary"
                />
              </div>
            </form>
            <div className="preview">
              {previewImage && !loadImageChange ? (
                <Image src={previewImage} alt="Preview" preview />
              ) : (
                <div>Loading...</div>
              )}
            </div>
          </div>
          <h4>Change Appearance</h4>
          <div className="color-picker">
            <Dropdown
              value={selectChangeAppearance}
              className="class-select mb-2 w-100"
              optionLabel="label"
              optionValue="value"
              onChange={(e) => changeAppearance(e)}
              options={[
                {
                  label: "Background Color",
                  value: "background",
                },
                {
                  label: "Secondary Color",
                  value: "secondary",
                },
                {
                  label: "Accent Color",
                  value: "accent",
                },
                {
                  label: "Primary Text Color",
                  value: "text",
                },
                {
                  label: "Secondary Text Color",
                  value: "secondary-text",
                },
              ]}
            />
            <div className="color-picker-cont flex justify-content-center align-items-center w-100">
              <ColorPicker
                value={bgcolor}
                format="hex"
                onChange={(e) => setBgColor(e.value)}
                inline
              />
            </div>
            <Button
              onClick={() => UpdateColor()}
              size="small"
              severity="secondary"
              label="Update"
              icon="pi pi-palette"
              className="mt-2"
            >
              <Ripple />
            </Button>
          </div>
          <h4 className="h5">Classes</h4>
          {isLoading ? (
            <div>
              <></>
            </div>
          ) : (
            <>
              <div className="add-class-cont">
                <Dropdown
                  value={deleteClass}
                  onChange={(e) => setDeleteClass(e.value)}
                  className="class-select"
                  options={classes}
                  placeholder="Select a class"
                />

                <div className="btn-add-cont">
                  <SplitButton
                    // icon="pi pi-user"
                    severity="secondary"
                    onClick={() => handleAdd("two")}
                    label="Add"
                    icon="pi pi-plus"
                    className="p-button-secondary p-button-outlined add-btn"
                    style={{ transform: "scale(0.8)" }}
                    model={[
                      {
                        label: "Import Classes",
                        icon: autoImportStatus
                          ? "pi pi-spinner"
                          : "pi pi-upload",
                        command: () => autoImportClass(),
                        className: autoImportStatus ? "p-disabled" : "",
                      },
                    ]}
                  ></SplitButton>

                  <Button
                    className="pi pi-trash"
                    onClick={() => handleDelete("classes", deleteClass)}
                    text
                    title="Delete class"
                    severity="danger"
                    size="small"
                  />
                  <Button
                    className="pi pi-file-edit"
                    onClick={(e) => editClass(e)}
                    text
                    severity="warning"
                    size="small"
                    // label="Edit"
                  />
                </div>
              </div>
              <h4 className="h6">Set Current Session</h4>
              <div className="add-session-cont">
                <Dropdown
                  value={currentSession}
                  onChange={(e) => changeCurrentSession(e.value)}
                  options={sessionArray}
                  placeholder="Select Session"
                />

                <div className="btn-add-cont">
                  <Button
                    icon="pi pi-plus"
                    onClick={() => handleAdd("three")}
                    text
                    severity="secondary"
                    label="Add"
                    size="small"
                  />
                  <Button
                    className="pi pi-trash"
                    onClick={() => handleDelete("session", currentSession)}
                    text
                    severity="danger"
                    size="small"
                  />
                </div>
              </div>
              <h4 className="h6">Add Payment Method</h4>
              <div className="add-payment-method-cont">
                <Dropdown
                  value={paymentMethod}
                  onChange={(e) => setPaymentMethod(e.value)}
                  options={paymentMethodArr}
                  placeholder="Payment Method"
                />

                <div className="btn-add-cont">
                  <Button
                    icon="pi pi-plus"
                    onClick={() => handleAdd("four")}
                    text
                    severity="secondary"
                    label="Add"
                    size="small"
                  />
                  <Button
                    className="pi pi-trash"
                    onClick={() => handleDelete("paymentMethod", paymentMethod)}
                    text
                    severity="danger"
                    size="small"
                  />
                </div>
              </div>
              <h4 className="h6">Add Payment Type</h4>
              <div className="add-payment-for-cont">
                <Dropdown
                  value={paymentFor}
                  onChange={(e) => setPaymentFor(e.value)}
                  options={paymentForArr}
                  placeholder="Payment For"
                />
                <div className="btn-add-cont">
                  <Button
                    icon="pi pi-plus"
                    onClick={() => handleAdd("five")}
                    text
                    severity="secondary"
                    label="Add"
                    size="small"
                  />
                  <Button
                    className="pi pi-trash"
                    text
                    onClick={() => handleDelete("paymentFor", paymentFor)}
                    severity="danger"
                    size="small"
                  />
                </div>
              </div>
              <h4 className="h6">Add Term</h4>
              <div className="add-term-cont">
                <Dropdown
                  value={currentTerm}
                  onChange={(e) => changeCurrentTerm(e.value)}
                  options={termArray}
                  placeholder="Select Term"
                />
                <div className="btn-add-cont">
                  <Button
                    icon="pi pi-plus"
                    onClick={() => handleAdd("six")}
                    text
                    severity="secondary"
                    label="Add"
                    size="small"
                  />
                  <Button
                    className="pi pi-trash"
                    onClick={() => handleDelete("term", currentTerm)}
                    text
                    severity="danger"
                    size="small"
                  />
                </div>
              </div>
            </>
          )}
        </div>
        <div className="fees-cont">
          <h3 className="h5">Fees</h3>
          <SplitButton
            // icon="pi pi-user"
            severity="secondary"
            size="small"
            label="Add"
            icon="pi pi-plus"
            onClick={() => handleAddFee("add-fee")}
            className="p-button-secondary p-button-outlined add-btn"
            model={[
              {
                label: "Save Fees",
                icon: "pi pi-save",
                command: () => saveFeeToHistory(),
              },
            ]}
          ></SplitButton>
          <table
            border={1}
            cellSpacing={50}
            className="table table-responsive table-bordered"
          >
            <thead>
              <tr>
                <th>Class</th>
                <th>amount</th>
                <th>action</th>
              </tr>
            </thead>
            <tbody>
              {isLoading ? (
                <tr className="loading">
                  <td colSpan={2}>
                    <></>
                  </td>
                </tr>
              ) : (
                <>
                  {Array.from(fees).map((item, index) => {
                    return (
                      <tr key={index + item}>
                        <td>{item[0]}</td>
                        <td className="td-input">
                          {" "}
                          {Number(item[1])?.toLocaleString()}{" "}
                        </td>
                        <td>
                          <div className="action-cont">
                            <div className="" title="Edit">
                              <Button
                                icon="pi pi-file-edit"
                                onClick={() => handleEdit(item[0], item[1])}
                                text
                                severity="warning"
                                size="small"
                                style={{ minWidth: "50px", marginRight: "5px" }}
                              />
                            </div>
                            <div className="" title="Delete">
                              <Button
                                className="pi pi-trash"
                                onClick={() => handleDelete("fees", item[0])}
                                text
                                severity="danger"
                                size="small"
                              />
                            </div>
                          </div>
                        </td>
                      </tr>
                    );
                  })}
                </>
              )}
            </tbody>
          </table>
        </div>
        <ModalCont
          title={`Edit Class '${deleteClass}'`}
          save={saveUpdateClass}
          classModal="update-class"
          loading={isLoading2}
          btn={isLoading2 ? "Save" : "Save"}
        >
          <div className="inputs-container">
            <div className="input-cont">
              <label htmlFor="update-class">Current Class</label>
              <input
                type="text"
                id="update-class"
                value={deleteClass?.toUpperCase()}
                disabled
                className="disabled"
              />
            </div>
            <div className="input-cont">
              <label htmlFor="new-u-c">New Class</label>
              <input
                type="text"
                id="new-u-c"
                value={updateClass}
                onChange={(e) => setUpdateClass(e?.target?.value)}
              />
            </div>
          </div>
        </ModalCont>
        <ModalCont
          title={"Edit " + feeEdit + " fee"}
          save={saveFees}
          classModal="one"
          loading={isLoading2}
          btn={isLoading2 ? "Save" : "Save"}
        >
          <div className="inputs-container">
            {/* <div className="info"></div> */}
            <div className="input-cont">
              <label htmlFor="current-fee">Current Fee</label>
              <input type="text" id="current-fee" value={currentFee} disabled />
            </div>
            <div className="input-cont">
              <label htmlFor="new-fee">New Fee</label>
              <InputNumber
                id="new-fee"
                value={newFee}
                onChange={(e) => setNewFee(e.value)}
                maxLength={6}
              />
            </div>
          </div>
        </ModalCont>
        <ModalCont
          title={"Add Session"}
          classModal="three"
          save={saveNewSession}
          loading={isLoading2}
          btn={isLoading2 ? "Add" : "Add"}
        >
          <div className="inputs-container">
            <div className="input-cont">
              <label htmlFor="add-session">Add Session</label>
              <input
                type="text"
                id="add-session"
                value={currentSession}
                onChange={(e) => setCurrentSession(e.target.value)}
              />
            </div>
          </div>
        </ModalCont>
        <ModalCont
          title={"Add payment method"}
          classModal="four"
          save={savePaymentMethod}
          loading={isLoading2}
          btn={isLoading2 ? "Add" : "Add"}
        >
          <div className="inputs-container">
            <div className="input-cont">
              <label htmlFor="add-payment-method">Add payment Method</label>
              <input
                type="text"
                id="add-payment-method"
                value={paymentMethod}
                onChange={(e) => setPaymentMethod(e.target.value)}
              />
            </div>
          </div>
        </ModalCont>
        <ModalCont
          title={"Add payment type"}
          classModal="five"
          save={savePaymentFor}
          loading={isLoading2}
          btn={isLoading2 ? "Add" : "Add"}
        >
          <div className="inputs-container">
            <div className="input-cont">
              <label htmlFor="add-payment-type">Add payment type</label>
              <input
                type="text"
                id="add-payment-type"
                value={paymentFor}
                onChange={(e) => setPaymentFor(e.target.value)}
              />
            </div>
          </div>
        </ModalCont>
        <ModalCont
          title={"Add term"}
          classModal="six"
          save={saveTerm}
          loading={isLoading2}
          btn={isLoading2 ? "Add" : "Add"}
        >
          <div className="inputs-container">
            <div className="input-cont">
              <label htmlFor="add-term">Add Term</label>
              <input
                type="text"
                id="add-term"
                value={currentTerm}
                onChange={(e) => setCurrentTerm(e.target.value)}
              />
            </div>
          </div>
        </ModalCont>
        <ModalCont
          title={"Add Fee"}
          classModal="add-fee"
          save={saveNewFee}
          loading={isLoading2}
          btn={isLoading2 ? "Add" : "Add"}
        >
          <div className="inputs-container">
            <div className="input-cont">
              <label htmlFor="add-fee">New Fee Name</label>

              <Dropdown
                value={newFeeName}
                onChange={(e) =>
                  e.value.name !== undefined
                    ? setNewFeeName(e.value.name)
                    : setNewFeeName(e.value)
                }
                options={dropdownClass}
                optionLabel="name"
                editable
                placeholder="Enter new Fee name"
              />
            </div>
            <div className="input-cont">
              <label htmlFor="add-new-fee">Fee</label>
              <InputNumber
                id="add-new-fee"
                value={newFeeAdd}
                onChange={(e) => setNewFeeAdd(e.value)}
                maxLength={8}
                placeholder="Enter amount"
              />
            </div>
          </div>
        </ModalCont>
        <ModalCont
          title={"Add Class"}
          classModal="two"
          save={saveNewClass}
          loading={isLoading2}
          btn={isLoading2 ? "Add" : "Add"}
        >
          <div className="inputs-container">
            <div className="input-cont">
              <label htmlFor="add-class">Class Name</label>
              <input
                type="text"
                id="add-class"
                value={newClass}
                onChange={(e) => setNewClass(e.target.value)}
              />
            </div>
          </div>
        </ModalCont>
      </div>
    </div>
  );
};

export default Settings;
