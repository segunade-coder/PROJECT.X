/* eslint-disable no-dupe-keys */
/* eslint-disable react/no-unescaped-entities */
/* eslint-disable no-unused-vars */
import { useContext, useEffect, useRef, useState, useId } from "react";
import {
  RiAddLine,
  RiCheckboxBlankCircleFill,
  RiCheckLine,
  RiCloseFill,
  RiEdit2Line,
  RiFileCopy2Line,
  RiRefreshLine,
  RiSearchLine,
  RiUpload2Fill,
} from "react-icons/ri";
import ModalCont from "../../small_comps/modal/ModalCont";
import "./students.css";
import { MainContext } from "../Helpers/Context";
import * as XLSX from "xlsx";
import ReactHTMLTableToExcel from "react-html-table-to-excel";
import toast, { Toaster } from "react-hot-toast";
import { OrganizationChart } from "primereact/organizationChart";
import { Card } from "primereact/card";
import { Button } from "primereact/button";
import { Ripple } from "primereact/ripple";
import { Dropdown } from "primereact/dropdown";
import { SpeedDial } from "primereact/speeddial";
import { Tooltip } from "primereact/tooltip";
import { Message } from "primereact/message";
import { AutoComplete } from "primereact/autocomplete";
import { Checkbox } from "primereact/checkbox";
import { Paginator } from "primereact/paginator";
import { Menu } from "primereact/menu";
import { ScrollTop } from "primereact/scrolltop";
import { ScrollPanel } from "primereact/scrollpanel";
import { InputText } from "primereact/inputtext";
import { Badge } from "primereact/badge";
const Students = () => {
  const [file, setFile] = useState([]);
  const [headers, setHeaders] = useState([]);
  const [classes, setClasses] = useState([]);
  const [sessionArray, setSessionArray] = useState([]);
  const [termArray, setTermArray] = useState([]);
  let { url, notifications, io, loggedSchool, admin } = useContext(MainContext);
  const [name, setName] = useState();
  const [currentTerm, setCurrentTerm] = useState("");
  const [currentSession, setCurrentSession] = useState("");
  const [filteredClass, setFilteredClass] = useState({ name: "" });
  const [addStudentClass, setAddStudentClass] = useState({ name: "" });
  const [guardianName, setGuardianName] = useState("");
  const [tel, setTel] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [isLoading2, setIsLoading2] = useState(false);
  const [isLoading3, setIsLoading3] = useState(false);
  const [autoname, setAutoName] = useState([]);
  const [searchId, setSearchId] = useState(0);
  const [students, setStudents] = useState([]);
  const [totalPages, setTotalPages] = useState(0);
  const [currentPage, setcurrentPage] = useState(1);
  const [updateName, setUpdateName] = useState("");
  const [updateClass, setUpdateClass] = useState({ name: "" });
  const [updateGuardianName, setUpdateGuardianName] = useState("");
  const [updateTel, setUpdateTel] = useState("");
  const [updateAddress, setUpdateAddress] = useState("");
  const [updateAdmNo, setUpdateAdmNo] = useState("");
  const [UpdateGuardianId, setUpdateGuardianId] = useState("");
  const [updatestatus, setUpdatestatus] = useState(true);
  const [updateDiscount, setUpdateDiscount] = useState("");
  const [path, setPath] = useState("students");
  const [selectedItem, setSelectedItem] = useState([]);
  const [selectAll, setSelectAll] = useState(false);
  const [showSelect, setShowSelect] = useState(false);
  const [showAction, setShowAction] = useState(false);
  const [selectAllAction, setSelectAllAction] = useState(false);
  const [selectedAction, setSelectedAction] = useState([]);
  const [promoteClass, setPromoteClass] = useState("");
  const [promoteLoading, setPromoteLoading] = useState(false);
  const [isLoadingUpload, setIsLoadingUpload] = useState(false);
  const [limit, setLimit] = useState(6);
  const [Gname, setGName] = useState();
  const [gAutoname, setGAutoname] = useState([]);
  const [guardianArr, setGuardianArr] = useState([]);
  const [copySuccess, setCopySuccess] = useState(false);
  const [studentTotal, setStudentTotal] = useState(0);
  const [changeReceipt, setchangeReceipt] = useState(false);
  const [findStudentStatus, setFindStudentStatus] = useState(false);
  const [addName, setAddName] = useState("");
  const [first, setFirst] = useState(0);
  const [rows, setRows] = useState(1);
  const menu = useRef(null);
  const [lastAdmNo, setLastAdmNo] = useState("");
  const [loadAdmNo, setLoadAdmNo] = useState(false);
  const [giveAdmNo, setGiveAdmNo] = useState(false);
  let filterArray = [];
  let id = useRef(0);
  let uniqueId = useId();

  let fetchFilters = () => {
    fetch(`${url}/main/payment/classes`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
    })
      .then((res) => res.json())
      .then((data) => {
        if (data.status) {
          let newCls;
          newCls = data.message[0];
          try {
            let testClass = JSON.parse(newCls.classes);
            let testTerm = data?.message[0]?.terms?.split(",");
            let testSession = data?.message[0]?.sessions?.split(",");
            let setClass = async () => {
              testClass = await testClass.map((classe) => {
                return { name: classe.toUpperCase() };
              });
              testTerm = await testTerm.map((term) => {
                return { name: term.toUpperCase() };
              });
              testSession = await testSession.map((session) => {
                return { name: session.toUpperCase() };
              });
              return { testClass, testTerm, testSession };
            };
            // setClasses(setClass().then((data) => data));
            setClass().then(({ testClass, testTerm, testSession }) => {
              setClasses(testClass);
              setTermArray(testTerm);
              setSessionArray(testSession);
            });
            setCurrentSession({
              name: data?.message[0]?.current_session?.toUpperCase(),
            });
            setCurrentTerm({
              name: data?.message[0]?.current_term.toUpperCase(),
            });
          } catch {
            notifications.warning(
              "failed to set datas. Try reloading",
              uniqueId
            );
          }
        }
      })

      .catch((err) => console.log(err));
  };
  let fetchRecord = (pathParam = "students") => {
    setIsLoading(true);
    fetch(
      `${url}/main/students/${pathParam}?page=${currentPage}&limit=${limit}&filteredClass=${filteredClass.name}&searchId=${searchId}&name=${name}&status=${findStudentStatus}`,
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
        setIsLoading(false);
        if (data.status) {
          try {
            setStudents(data.message);
            setStudentTotal(data.total);
            setTotalPages(Math.ceil(data.total / limit));
          } catch {
            toast.error("Fail to set datas");
          }
        } else {
          toast.error(data.message);
        }
      })
      .catch((err) => {
        setIsLoading(false);
        console.log(err);
      });
  };

  useEffect(() => {
    fetchFilters();
    return () => {
      setClasses([]);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [document.readyState]);

  useEffect(() => {
    fetchRecord(path);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [currentPage, limit]);

  let showModal = () => {
    setName("");
    setGuardianName("");
    setTel("");
    setFilteredClass({ name: "" });
    document
      .getElementsByClassName("student-add-modal")[0]
      .classList.add("show-modal");
    document.body.style.overflow = "hidden";
    window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
    setLoadAdmNo(true);
    try {
      setLoadAdmNo(true);
      io.emit("get-admission-no", { loggedSchool });
      io.on("set-admission-no", ({ data }) => {
        setLoadAdmNo(false);
        let adm_no = data.trim();
        if (adm_no !== null && adm_no !== "") {
          adm_no = adm_no.split("/");
          let number = Number(adm_no[1]);
          number += 1;
          if (String(number).length < 5) {
            number = "" + number;
            number = number.padStart(5, 0);
          }
          adm_no[1] = number;
          let new_adm_no = adm_no.join("/")?.toUpperCase();
          setLastAdmNo(new_adm_no);
        }
      });
    } catch (error) {
      console.log(error);
      setLoadAdmNo(true);
    }
  };
  let autoCompleteTemplate = (item) => {
    return (
      <div className="flex align-items-center custom-autocom">
        <span className="name" style={{ marginRight: ".5rem" }}>
          {item.name?.toUpperCase()}
        </span>
        <span className="class">{item.class?.toUpperCase()}</span>
      </div>
    );
  };
  let gAutoCompleteTemplate = (item) => {
    return (
      <div className="flex align-items-center custom-autocom">
        <span className="name">{item.guardian_name?.toUpperCase()}</span>
      </div>
    );
  };
  let saveStudent = () => {
    if (addStudentClass.name === "" || addName === "" || guardianName === "") {
      notifications.warning("Enter all necessary fields", uniqueId);
    } else {
      setIsLoading2(true);
      fetch(`${url}/main/students/add-student`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          name: addName?.trim()?.toLowerCase(),
          filteredClass: addStudentClass.name?.trim()?.toLowerCase(),
          guardianName: guardianName?.trim()?.toLowerCase(),
          tel: tel?.trim(),
          giveAdmNo: giveAdmNo,
          admNo: giveAdmNo ? lastAdmNo?.trim().toLowerCase() : "",
          guardian_id: tel?.trim(),
        }),
        credentials: "include",
      })
        .then((res) => res.json())
        .then((data) => {
          setIsLoading2(false);
          if (data.status) {
            notifications.success(data.message, uniqueId);
            io.emit("get-admission-no", { loggedSchool });
            setName("");
            setAddName("");
            setGiveAdmNo(false);
            setLastAdmNo("");
            setAddStudentClass({ name: "" });
            setPath("students");
            fetchRecord("students");
            document
              .getElementsByClassName("student-add-modal")[0]
              .classList.remove("show-modal");
            document.body.style.overflow = "auto";
            document.body.style.top = "";
          } else {
            notifications.warning(data.message, uniqueId);
          }
        })
        .catch((err) => {
          toast.error("Error: failed to save student");
          setIsLoading2(false);
          console.log(err);
        });
    }
  };
  let handleUpload = (e) => {
    const files = e.target.files[0];
    setFile([]);
    setHeaders([]);
    let loadingSheet = uniqueId;
    notifications.loading("Loading Sheet...", loadingSheet);
    const promise = new Promise((resolve, reject) => {
      const FileRead = new FileReader();
      FileRead.readAsArrayBuffer(files);

      FileRead.onload = (e) => {
        const bufferArray = e.target.result;

        try {
          const wb = XLSX.read(bufferArray, { type: "buffer" });
          const wsname = wb.SheetNames[0];
          const ws = wb.Sheets[wsname];
          const data = XLSX.utils.sheet_to_json(ws);
          toast.dismiss(loadingSheet);
          resolve(data);
        } catch (error) {
          toast.dismiss(loadingSheet);
          toast.error("Error: unable to parse file");
        }
      };
      FileRead.onerror = (error) => {
        toast.dismiss(loadingSheet);
        toast.error("Error: unable to parse file");
        reject(error);
      };
    });
    promise
      .then((d) => {
        if (d?.length !== 0) {
          let header = d[0];
          header = Object.keys(header);
          setHeaders(header);
          setFile(d);
        }
        document
          .getElementsByClassName("upload-modal")[0]
          .classList.add("show-modal");
        document.body.style.overflow = "hidden";
        window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
      })
      .catch((err) => {
        toast.dismiss(loadingSheet);
        toast.error("Error: unable to parse file. Make sure its an excel file");
      });
  };
  let saveUpload = () => {
    let toLower = (str) => {
      let newStr = str?.toString()?.toLowerCase()?.trim();
      return newStr;
    };
    let formattedHeader = headers?.map((head) =>
      head?.trim()?.toLowerCase().replace(/ /g, "_")
    );
    let tempFile = [];
    file.forEach((element) => {
      let newObj = [];
      for (let key in element) {
        newObj.push({ [key]: toLower(element[key]) });
      }
      tempFile.push(newObj);
    });
    setIsLoadingUpload(true);
    let uploadSheetLoad = uniqueId;
    notifications.loading("Uploading sheet...", uploadSheetLoad);
    fetch(`${url}/main/students/add-student-upload`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        header: formattedHeader,
        file: tempFile,
      }),
      credentials: "include",
    })
      .then((res) => res.json())
      .then((data) => {
        setIsLoadingUpload(false);
        toast.dismiss(uploadSheetLoad);
        if (data.status) {
          notifications.success(data.message, uniqueId);
          setName("");
          setFilteredClass({ name: "" });
          setPath("students");
          setcurrentPage(1);
          fetchRecord("students");
          document
            .getElementsByClassName("upload-modal")[0]
            .classList.remove("show-modal");
          document.body.style.overflow = "auto";
          document.body.style.top = "";
        } else {
          notifications.warning(data.message, uniqueId);
        }
      })
      .catch((err) => {
        toast.dismiss(uploadSheetLoad);
        toast.error("Error uploading sheet.");
        setIsLoadingUpload(false);
      });
  };
  let handleSetName = (e) => {
    setSearchId(0);
    if (e.value.name != undefined) {
      setName(e.value.name?.toUpperCase());
    } else {
      setName(e.value.toUpperCase());
    }
  };
  let handleSetGName = (e) => {
    setSearchId(0);
    if (e.value.guardian_name !== undefined) {
      setGName(e.value.guardian_name?.toUpperCase());
    } else {
      setGName(e.value?.toUpperCase());
    }
  };
  let findId = (e) => {
    e.preventDefault();
    setAutoName([]);
    if (Number(searchId) !== 0 && searchId !== null) setFindStudentStatus(true);
    else setFindStudentStatus(false);
    let status = findStudentStatus;
    let datas = {
      searchId,
      name: name.trim().toLowerCase(),
      status,
    };
    if (searchId === 0 && name === "" && name === null) {
      notifications.warning("Empty search", uniqueId);
    } else {
      let findIDLoading = toast.loading("Fetching Data...");
      fetch(
        `${url}/main/students/findId?page=1&limit=${limit}&searchId=${searchId}&name=${name
          .trim()
          .toLowerCase()}&status=${status}`,
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
          toast.dismiss(findIDLoading);
          if (data.status) {
            setPath("findId");
            setStudents(data.message);
            setStudentTotal(data.total);
            setTotalPages(Math.ceil(data.total / limit));
          } else {
            toast.error(data.message);
          }
        })

        .catch((err) => {
          toast.dismiss(findIDLoading);
          toast.error(err);
          console.log(err);
        });
    }
  };
  let handleAutoClick = (e) => {
    setSearchId(e?.value?.id);
  };
  let handleGAutoClick = (e) => {
    setSearchId(e?.value?.guardian_id);
    // console.log(e.value);
  };
  let autoCompleteName = (value) => {
    setSearchId(0);
    if (value.length > 1) {
      if (filteredClass.name !== "") {
        filterArray.push({ class: filteredClass.name?.trim()?.toLowerCase() });
      }
      if (filterArray.length > 0) {
        fetch(`${url}/main/students/find-name`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            name: value?.trim().toLowerCase(),
            condition: true,
            filterArray,
          }),
          credentials: "include",
        })
          .then((res) => res.json())
          .then((data) => {
            if (data.status) {
              setAutoName(data.message);
            }
          })

          .catch((err) => console.log(err));
      } else {
        fetch(`${url}/main/students/find-name`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            name: value,
            condition: false,
          }),
          credentials: "include",
        })
          .then((res) => res.json())
          .then((data) => {
            if (data.status) {
              setAutoName(data.message);
            }
          })

          .catch((err) => console.log(err));
      }
    } else {
      setAutoName([]);
    }
  };
  let autoGCompleteName = () => {
    setSearchId(0);
    if (Gname.length > 1) {
      fetch(`${url}/main/students/find-g-name`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          name: Gname?.trim().toLowerCase(),
        }),
        credentials: "include",
      })
        .then((res) => res.json())
        .then((data) => {
          if (data.status) {
            setGAutoname(data.message);
          }
        })

        .catch((err) => console.log(err));
    } else {
      setGAutoname([]);
    }
  };
  let clearG = (e) => {
    e.preventDefault();
    setGName("");
    setGAutoname([]);
    setSearchId(0);
    setGuardianArr([]);
  };
  let clear = (e) => {
    e.preventDefault();
    setPath("students");
    setcurrentPage(1);
    setName("");
    setFilteredClass({ name: "" });
    setAutoName([]);
    fetchRecord("students");
    setShowAction(false);
    setShowSelect(false);
    setSelectedAction([]);
    setSelectedItem([]);
    document
      .querySelectorAll(".filter")
      .forEach((elem) => elem.classList.remove("filter"));
  };
  let handlePageChange = (newPage) => {
    setcurrentPage(newPage);
    fetch(
      `${url}/main/students/${path}?page=${newPage}&limit=${limit}&filteredClass=${filteredClass.name}&searchId=${searchId}&name=${name}&status=${findStudentStatus}`,
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
        setIsLoading(false);
        if (data.status) {
          try {
            setStudents(data.message);
            // console.log(data.message)
          } catch {
            console.log("failed to set datas");
          }
        } else {
          notifications.warning(data.message, uniqueId);
        }
      })
      .catch((err) => {
        setIsLoading(false);
        console.log(err);
      });
  };
  let deleteRecord = (key) => {
    if (key) {
      notifications.confirmDelete(
        "Are you sure you wan to delete?",
        () => {
          let deleteLoad = uniqueId;
          notifications.loading("Deleting...", deleteLoad);
          fetch(`${url}/main/students/delete?key=${key}`, {
            method: "GET",
            headers: {
              "Content-Type": "application/json",
            },
            credentials: "include",
          })
            .then((res) => res.json())
            .then((data) => {
              toast.dismiss(deleteLoad);

              if (data.status) {
                notifications.success(data.message, uniqueId);
                setStudents(students.filter((data) => data.id !== key));
              } else {
                notifications.warning(data.message, uniqueId);
              }
            })
            .catch((err) => {
              toast.dismiss(deleteLoad);
              toast.error("Error:Failed to delete.");
              console.log(err);
            });
        },
        () => {},
        [key]
      );
    }
  };
  let reset = () => {
    setUpdateName("");
    setUpdateClass({ name: "" });
    setUpdateGuardianName("");
    setUpdateGuardianId("");
    setUpdateAdmNo("");
    setUpdateTel("");
    setUpdateAddress("");
    setUpdatestatus("");
  };
  let editRecord = (key) => {
    reset();
    if (key) {
      let editLoad = uniqueId;
      notifications.loading("Fetching data...", editLoad);
      fetch(`${url}/main/students/get-view?key=${key}`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
      })
        .then((res) => res?.json())
        .then((data) => {
          toast.dismiss(editLoad);

          if (data?.status) {
            setUpdateName(data?.message[0]?.name?.toUpperCase());
            setUpdateClass({ name: data?.message[0]?.class.toUpperCase() });
            id.current = data?.message[0]?.id;
            setUpdateGuardianName(
              data?.message[0]?.guardian_name?.toUpperCase()
            );
            setUpdateGuardianId(data?.message[0]?.guardian_id);
            setUpdateAdmNo(data?.message[0]?.adm_no?.toUpperCase());
            setUpdateTel(data?.message[0]?.phone_number);
            data?.message[0]?.status?.toLowerCase() === "active"
              ? setUpdatestatus(true)
              : setUpdatestatus(false);
            setUpdateAddress(data?.message[0]?.address?.toUpperCase());
            setUpdateDiscount(
              data?.message[0]?.discounts !== ""
                ? data?.message[0]?.discounts?.toUpperCase()
                : "NONE"
            );
            document
              .getElementsByClassName("edit-modal")[0]
              .classList.add("show-modal");
            document.body.style.overflow = "hidden";
            window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
          } else {
            notifications.warning(data.message, uniqueId);
          }
          // console.log(data.message[0].name, viewRemark);
        })
        .catch((err) => {
          toast.dismiss(editLoad);
          toast.error("Error: Failed to fetch data");
          console.log(err);
        });
    }
  };
  let saveEdit = () => {
    if (
      updateName === "" ||
      updateClass.name === "" ||
      updateGuardianName === ""
    ) {
      notifications.warning("Enter necessary fields", uniqueId);
    } else {
      setIsLoading3(true);
      let editLoad = uniqueId;
      notifications.loading("Saving...", editLoad);
      fetch(`${url}/main/students/save-edit`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          id: id.current,
          name: updateName?.trim()?.toLowerCase(),
          newClass: updateClass.name?.trim()?.toLowerCase(),
          guardianName: updateGuardianName?.trim()?.toLowerCase(),
          tel: updateTel?.trim(),
          address: updateAddress?.toLowerCase()?.trim(),
          guardianID: UpdateGuardianId.toLowerCase().trim(),
          studentAdm: updateAdmNo?.toLowerCase()?.trim(),
          discounts: updateDiscount?.trim()?.toLowerCase(),
          status: updatestatus,
        }),
        credentials: "include",
      })
        .then((res) => res?.json())
        .then((data) => {
          setIsLoading3(false);
          if (data.status) {
            fetchRecord(path);
            notifications.success(data.message, editLoad);
            document
              .getElementsByClassName("edit-modal")[0]
              .classList.remove("show-modal");
            document.body.style.overflow = "auto";
            document.body.style.top = "";
          } else {
            notifications.warning(data.message, editLoad);
          }
        })
        .catch((err) => {
          // toast.dismiss(editLoad);
          setIsLoading3(false);
          console.log(err);
          notifications.warning("Error:Failed to save", editLoad);
        });
    }
  };
  let autoKey = () => {
    let randomKey = function () {
      let key = Date.now() + parseInt(Math.random().toString().slice(2));
      return key.toString(30).repeat(2);
    };
    if (UpdateGuardianId === "") setUpdateGuardianId(randomKey() + randomKey());
  };
  let changeClass = (e) => {
    setFilteredClass(e.value);
    if (e?.value.name === "") {
      // setPath("students");
      // setcurrentPage(1)
      // fetchRecord();
    } else {
      setPath("class-view");
      setIsLoading(true);
      setcurrentPage(1);
      let uniqid = uniqueId;
      notifications.loading("Fetching data...", uniqid);
      fetch(
        `${url}/main/students/class-view?page=1&limit=${limit}&filteredClass=${e?.value.name}`,
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
          toast.dismiss(uniqid);

          setIsLoading(false);
          if (data.status) {
            try {
              setStudents(data.message);
              setTotalPages(Math.ceil(data?.total / limit));
              setStudentTotal(data?.total);
            } catch {
              toast.error("failed to set datas");
            }
          } else {
            notifications.warning(data.message, uniqueId);
          }
        })
        .catch((err) => {
          setIsLoading(false);
          toast.dismiss(uniqid);
          console.log(err);
        });
    }
  };
  let showSelectFnc = (e) => {
    e.preventDefault();
    setPromoteClass("");
    setSelectedItem([]);
    setSelectAll(false);
    setShowAction(false);
    setShowSelect(!showSelect);
  };
  let selectFnc = (item) => {
    if (selectedItem.includes(item)) {
      setSelectedItem(selectedItem.filter((i) => i !== item));
    } else {
      setSelectedItem([...selectedItem, item]);
    }
  };
  let selectActionFnc = (item) => {
    if (selectedAction.includes(item)) {
      setSelectedAction(selectedAction.filter((i) => i !== item));
    } else {
      setSelectedAction([...selectedAction, item]);
    }
  };
  let selectAllFnc = (event) => {
    setSelectAll(event.checked);
    if (event?.checked) {
      setSelectedItem(students.map((i) => i.id));
    } else {
      setSelectedItem([]);
    }
  };
  let selectAllActionFnc = (event) => {
    setSelectAllAction(event.checked);
    if (event?.checked) {
      setSelectedAction(students.map((i) => i.id));
    } else {
      setSelectedAction([]);
    }
  };
  let savePromote = (e) => {
    e.preventDefault();
    if (
      selectedItem.length === 0 ||
      promoteClass.name === "" ||
      promoteClass.name === "" ||
      promoteClass === null ||
      promoteClass === ""
    ) {
      notifications.warning("Nothing to update", uniqueId);
    } else {
      setPromoteLoading(true);
      let uniqid = uniqueId;
      notifications.loading("Saving...", uniqid);
      fetch(`${url}/main/students/promote`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
        body: JSON.stringify({
          ids: selectedItem,
          promoteClass: promoteClass.name?.trim()?.toLowerCase(),
          receipt: changeReceipt,
          term: currentTerm.name.trim()?.toLowerCase(),
          session: currentSession.name,
        }),
      })
        .then((res) => res?.json())
        .then((data) => {
          toast.dismiss(uniqid);
          setPromoteLoading(false);
          if (data?.status) {
            notifications.success(data?.message, uniqueId);
            fetchRecord(path);
            setShowSelect(false);
          } else {
            notifications.warning(data?.message, uniqueId);
          }
        })
        .catch((err) => {
          toast.dismiss(uniqid);
          setPromoteLoading(false);
          console.log(err);
          toast.error("Error: " + err);
        });
    }
  };
  function formatDataForTreeView(data) {
    const treeData = [];
    for (const item of data) {
      let parent = treeData?.find(
        (parent) =>
          parent?.data.name?.toLowerCase().trim() ===
            item?.guardian_name?.toLowerCase()?.trim() &&
          parent?.key === item?.guardian_id
      );
      // console.log(parent);
      if (!parent) {
        parent = {
          key: item?.guardian_id,
          expanded: true,
          type: "person",
          data: {
            name: item?.guardian_name?.toUpperCase(),
            title: "PARENT",
          },
          className: "text-white",
          style: { borderRadius: "12px", background: "#6366f1" },
          children: [],
        };
        treeData.push(parent);
      }

      parent?.children?.push({
        type: "person",
        className: "bs-purple-500 text-white",
        data: {
          name: item?.name?.toUpperCase(),
          title: "CHILD",
          class: item?.class?.toUpperCase(),
        },
        style: { borderRadius: "12px", background: "#a855f7" },
        key: item?.id,
      });
    }
    // console.log(treeData);
    return treeData;
  }
  let setLimitFnc = (e) => {
    setcurrentPage(1);
    setLimit(e?.value);
  };
  let searchByGuardianShowModal = (e) => {
    e.preventDefault();
    setGName("");
    setGAutoname([]);
    setSearchId(0);
    setGuardianArr([]);
    document
      .getElementsByClassName("search-modal")[0]
      .classList.add("show-modal");
    document.body.style.overflow = "hidden";
    window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
  };
  let findGuardian = (e) => {
    e.preventDefault();
    setGAutoname([]);
    let datas = {
      searchId: searchId !== 0 ? searchId : Gname.trim(),
    };
    let uniqid = uniqueId;
    notifications.loading("Loading...", uniqid);
    fetch(`${url}/main/students/find-guardian`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(datas),
      credentials: "include",
    })
      .then((res) => res.json())
      .then((data) => {
        toast.dismiss(uniqid);

        if (data.status) {
          setGuardianArr(data?.message);

          setGuardianArr(formatDataForTreeView(data.message));
          // console.log(formatDataForTreeView(data.message));
        }
      })

      .catch((err) => {
        toast.dismiss(uniqid);
        console.log(err);
      });
  };
  let copyGuardian = (e, id) => {
    e.preventDefault();
    var textField = document.createElement("textarea");
    textField.innerText = id;
    document.body.appendChild(textField);
    textField.select();
    document.execCommand("copy");
    textField.remove();
    setCopySuccess(true);
    toast.success("Copied!");
    setTimeout(() => setCopySuccess(false), 5000);
  };
  let nodeTemplate = (node) => {
    if (node.type === "person") {
      return (
        <div
          className="flex flex-column"
          style={{ minWidth: "200px", maxWidth: "300px" }}
        >
          <div
            className="flex flex-column align-items-center"
            style={{ display: "flex", flexDirection: "column" }}
          >
            <span className="w-3rem h-3rem">
              <i className="pi pi-user"></i>
            </span>
            <small className="mb-1">{node.data.title}</small>

            <span className="font-bold mb-1" style={{ fontWeight: "bold" }}>
              {node.data.name}
            </span>
            <span className="font-bold mb-1" style={{ fontWeight: "bold" }}>
              {node.children?.length > 0 ? (
                <Badge value={node.children?.length} severity="info"></Badge>
              ) : (
                ""
              )}
            </span>
            {node.data.class && <span>{node.data.class}</span>}
          </div>
        </div>
      );
    }
    return node.label;
  };
  let changePage = (e) => {
    setFirst(e.first);
    setRows(e.rows);
    // console.log(e, currentPage, limit);
    handlePageChange(e.page + 1);
  };
  let setShowActionFnc = () => {
    setShowSelect(false);
    setSelectAllAction(false);
    setSelectedAction([]);
    setShowAction(!showAction);
  };
  let deleteMultiple = () => {
    if (selectedAction.length > 0) {
      notifications.confirmDelete(
        `Are you sure you want to delete ${selectedAction.length} ${
          selectedAction.length > 1 ? "students" : "student"
        }?`,
        () => {
          fetch(`${url}/main/students/delete-multiple`, {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({ ids: selectedAction }),
            credentials: "include",
          })
            .then((res) => res.json())
            .then((data) => {
              if (data.status) {
                notifications.success(data.message, "amen");
                setSelectedAction([]);
                fetchRecord(path);
              } else {
                notifications.warning(data.message, "amen");
                setSelectedAction([]);
              }
            })
            .catch((err) => {
              console.log(err);
              notifications.warning("Failed to delete.", "amen");
            });
        },
        () => {},
        [selectedAction]
      );
    } else {
      notifications.warning("Make a selection.", "amen");
    }
  };
  const handleMultipleUpdate = () => {
    if (selectedAction.length > 0) {
      setUpdateAddress("");
      setUpdateClass({ name: "" });
      setUpdateGuardianId("");
      setUpdateGuardianName("");
      setUpdateTel("");
      setUpdatestatus("");
      setUpdateDiscount("");
      setUpdatestatus(true);
      document
        .getElementsByClassName("edit-multiple-modal")[0]
        .classList.add("show-modal");
      document.body.style.overflow = "hidden";
      window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
    } else {
      notifications.warning("Make a selection.", "amen");
    }
  };
  let saveMultipleEdit = () => {
    notifications.confirm(
      "Are you sure you want to update?",
      () => {
        let others = {
          updateGuardianName,
          updateClass: updateClass.name,
          updateAddress,
          updateTel,
          UpdateGuardianId,
          updateDiscount,
          updatestatus,
        };
        fetch(`${url}/main/students/update-multiple`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            ids: selectedAction,
            others,
          }),
          credentials: "include",
        })
          .then((res) => res.json())
          .then((data) => {
            setIsLoading(false);
            if (data.status) {
              notifications.success(data.message, "so");
              setSelectedAction([]);
              setShowAction(false);
              fetchRecord(path);
              document
                .getElementsByClassName("edit-multiple-modal")[0]
                .classList.remove("show-modal");
              document.body.style.overflow = "auto";
              document.body.style.top = "";
            } else {
              notifications.warning(data.message, "so");
              setIsLoading(false);
              setSelectedAction([]);
            }
          })
          .catch((err) => {
            console.log(err);
            notifications.warning("Failed to Update.", "so");
          });
      },
      () => {},
      []
    );
  };
  let onBlur = (e, id) => {
    if (e.value != undefined && e.value != "") {
      if (id === "filter-class") {
        document.querySelector(`.${id}`).classList.add("filter");
      }
    }
  };
  return (
    <div className="__students">
      <h2>Students</h2>
      <div>
        <Toaster position="top-center" reverseOrder={false} />
      </div>
      <div className="add-container">
        <Tooltip
          target=".speedial-bottom-right .p-speeddial-action"
          position="left"
        />
        <SpeedDial
          model={[
            {
              label: "Add Student",
              icon: "pi pi-plus",
              command: () => {
                showModal();
              },
            },
            {
              label: "Upload file",
              icon: "pi pi-upload",
              command: () => {
                document.getElementById("upload").click();
              },
            },
            {
              label: "download XLS template",
              icon: "pi pi-download",
              command: () => {
                document.getElementById("xls-button").click();
              },
            },
          ]}
          direction="left"
          buttonClassName="p-button-secondary p-button-outlined"
          className="speedial-bottom-right"
          showIcon="pi pi-bars"
          hideIcon="pi pi-times"
          transitionDelay={70}
          // mask={true}
        />
      </div>
      <div
        className="btn btn-primary btn-sm upload"
        style={{ display: "none" }}
      >
        <label htmlFor="upload">
          <RiUpload2Fill /> Upload XLS
        </label>
        <input
          type="file"
          name="upload"
          style={{ display: "none" }}
          id="upload"
          accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"
          onChange={handleUpload}
        />
        <ReactHTMLTableToExcel
          style={{ display: "none" }}
          id="xls-button"
          className="xls-button btn btn-light btn-sm ml-3 d-none"
          table="table-to-xls"
          filename={"Student Template"}
          sheet="students"
          buttonText="Download Template"
        />
      </div>

      <form className="search-container">
        <label htmlFor="name">Name</label>
        <div className="input-filter-cont ">
          <AutoComplete
            value={name}
            suggestions={autoname}
            completeMethod={(e) => autoCompleteName(e.query)}
            onChange={(e) => handleSetName(e)}
            field="name"
            itemTemplate={autoCompleteTemplate}
            onSelect={(e) => handleAutoClick(e)}
            placeholder="Search name here"
            autoFocus={true}
          />
        </div>
        <div className="class-cont">
          <label>Select class</label>
          <Dropdown
            value={filteredClass}
            onChange={(e) => changeClass(e)}
            className="filter-class"
            options={classes}
            placeholder="Select a class"
            optionLabel="name"
            onBlur={(e) => onBlur(e, "filter-class")}
          ></Dropdown>
        </div>
        <div className="btn-cont">
          <Button
            onClick={(e) => findId(e)}
            className="p-ripple"
            icon="pi pi-search"
            label="Find"
            severity="success"
            size="small"
          >
            <Ripple />
          </Button>
          <Button
            onClick={(e) => clear(e)}
            className="p-ripple"
            icon="pi pi-times"
            label="Clear"
            severity="danger"
            size="small"
          >
            <Ripple />
          </Button>
          <Button
            className="p-ripple"
            title="search by guardian's name"
            onClick={(e) => searchByGuardianShowModal(e)}
            icon="pi pi-users"
            label="SBGN"
            severity="secondary"
            size="small"
          >
            <Ripple />
          </Button>
          {admin ? (
            <Button
              className="p-ripple"
              onClick={(e) => showSelectFnc(e)}
              icon="pi pi-arrow-up-right"
              label="Promote"
              // severity="success"
              size="small"
              style={{ width: "fit-content" }}
            >
              <Ripple />
            </Button>
          ) : (
            <></>
          )}
        </div>
      </form>
      {showSelect && (
        <>
          <Card className="select-cont" title="Promote student">
            <Message
              text="click 'Change Receipt' to make changes to receipts also, selecting the term and session"
              // className="w-50"
              severity="info"
              icon="pi pi-bell"
            />
            <div className="input-cont mt-2">
              <label htmlFor="select-all">
                <small>Select all</small>
              </label>
              <Checkbox
                checked={selectAll}
                onChange={selectAllFnc}
                id="select-all"
              />
            </div>
            <div className="input-cont">
              <label htmlFor="promote-class">
                <small>Class</small>
              </label>
              <Dropdown
                value={promoteClass}
                className="filter-class"
                options={classes}
                placeholder="Select a class"
                optionLabel="name"
                id="promote-class"
                onChange={(e) => setPromoteClass(e.value)}
              />
            </div>
            <div className="change-receipt input-cont">
              <label htmlFor="change-re">Change Receipt</label>
              <Checkbox
                checked={changeReceipt}
                onChange={(e) => setchangeReceipt(e?.checked)}
                id="change-re"
              />
              {changeReceipt && (
                <>
                  <Dropdown
                    value={currentTerm}
                    options={termArray}
                    placeholder="Select Term"
                    onChange={(e) => setCurrentTerm(e.value)}
                    className="filter-term"
                    optionLabel="name"
                  ></Dropdown>
                  <Dropdown
                    value={currentSession}
                    options={sessionArray}
                    placeholder="Select Session"
                    onChange={(e) => setCurrentSession(e?.value)}
                    className="filter-sess"
                    optionLabel="name"
                  ></Dropdown>
                </>
              )}
            </div>
            <Button
              icon="pi pi-check"
              onClick={(e) => savePromote(e)}
              loading={promoteLoading}
              label="Save"
              size="small"
              style={{ width: "fit-content" }}
              severity="secondary"
            >
              <Ripple />
            </Button>
            <div className="close" onClick={() => setShowSelect(false)}>
              <RiCloseFill fill="red" size={30} />{" "}
            </div>
          </Card>
        </>
      )}
      <div className="table-cont">
        <div
          style={{
            display: "flex",
            justifyContent: "flex-end",
            gap: ".3rem",
            flexWrap: "wrap",
            marginRight: ".3rem",
            alignItems: "center",
            padding: ".5rem",
          }}
        >
          <Button
            icon="pi pi-refresh"
            text
            severity="info"
            size="small"
            onClick={() => fetchRecord(path)}
          ></Button>
          <Button
            icon="pi pi-download"
            text
            severity="secondary"
            size="small"
            onClick={() => document.getElementById("xls-button-2").click()}
          ></Button>
          <small>Total: {studentTotal}</small>
          <Button
            icon="pi pi-user-edit"
            label={showAction ? "hide" : "show"}
            title={showAction ? "hide action" : "show action"}
            text
            severity="help"
            size="small"
            className="action-btn"
            onClick={() => setShowActionFnc()}
            style={{ boxShadow: "none" }}
          >
            <Ripple />
          </Button>
          {showAction && (
            <>
              <div className="actions">
                <Checkbox
                  checked={selectAllAction}
                  onChange={selectAllActionFnc}
                  title="Select all"
                />
                <small style={{ marginLeft: ".4rem" }}>Select all</small>
                <Menu
                  model={[
                    {
                      label: "Delete",
                      icon: "pi pi-fw pi-trash",
                      command: () => deleteMultiple(),
                    },
                    {
                      label: "Update",
                      icon: "pi pi-fw pi-refresh",
                      command: () => handleMultipleUpdate(),
                    },
                  ]}
                  popup
                  ref={menu}
                />
                <Button
                  icon="pi pi-ellipsis-v"
                  size="small"
                  link
                  onClick={(event) => menu.current.toggle(event)}
                  style={{
                    marginLeft: ".5rem",
                    borderRadius: "50%",
                    boxShadow: "none",
                  }}
                />
              </div>
            </>
          )}
        </div>
        <div className="our-table">
          <div className="header">
            Name
            <Dropdown
              value={limit}
              options={[6, 10, 20, 50, 70, 100, 200, 500, 1000]}
              onChange={(e) => setLimitFnc(e)}
            />
          </div>
          <div className="header">Class</div>
          <div className="header">Status</div>
          <hr />
          {isLoading ? (
            <div
              className="table-row loading"
              style={{ textAlign: "center", padding: ".3rem" }}
            >
              loading...
            </div>
          ) : students.length === 0 ? (
            <div
              className="table-row"
              style={{ textAlign: "center", padding: ".3rem" }}
            >
              No students available
            </div>
          ) : (
            students.map((record) => (
              <details
                className="table-row"
                key={record?.keyid + new Date() + Math.random()}
              >
                <summary>
                  <span className="span-body">
                    <span>
                      {showSelect && (
                        <Checkbox
                          checked={selectedItem.includes(record?.id)}
                          onChange={(e) => selectFnc(record?.id)}
                        />
                      )}
                      {showAction && (
                        <Checkbox
                          checked={selectedAction.includes(record?.id)}
                          onChange={(e) => selectActionFnc(record?.id)}
                        />
                      )}
                    </span>
                    <span>{record?.name}</span>
                  </span>
                  <span className="span-body">{record?.class}</span>
                  <span className="status span-body">
                    <span> {record?.status}</span>
                    {record?.status?.toLowerCase() === "active" ? (
                      // <RiCheckboxBlankCircleFill fill="green" />
                      <i
                        className="pi pi-verified svg"
                        style={{ color: "green" }}
                      ></i>
                    ) : (
                      // <RiCheckboxBlankCircleFill fill="red" />
                      <i
                        className="pi pi-verified svg"
                        style={{ color: "red" }}
                      ></i>
                    )}
                  </span>
                </summary>
                <p className="alert alert-info">
                  <small className="alert-heading h5">Details</small>
                  <span className="details-content">
                    <span>Name</span>
                    <span>{record?.name}</span>
                  </span>
                  <span className="details-content">
                    <span>Class</span>
                    <span>{record?.class}</span>
                  </span>
                  <span className="details-content">
                    <span>Guardian's Name</span>
                    <span>{record.guardian_name}</span>
                  </span>
                  <span className="details-content">
                    <span>Guardian's Tel</span>
                    <span>{record.phone_number}</span>
                  </span>
                  <span className="details-content">
                    <span>Admission No</span>
                    <span>{record?.adm_no}</span>
                  </span>
                  <span className="details-content">
                    <span>Special Discount</span>
                    <span>{record?.discounts}</span>
                  </span>
                  <span className="details-content">
                    <span>Date Registered</span>
                    <span>{new Date(record.created_at).toDateString()}</span>
                  </span>
                  <span className="details-content">
                    {admin ? (
                      <>
                        <button
                          onClick={() => editRecord(record.id)}
                          className="btn btn-light btn-sm mt-2"
                        >
                          <RiEdit2Line fill="orangered" /> Update
                        </button>
                        <button
                          onClick={() => deleteRecord(record.id)}
                          className="btn btn-danger btn-sm mt-2"
                        >
                          Delete
                        </button>
                      </>
                    ) : (
                      <></>
                    )}
                    <button
                      onClick={(e) => copyGuardian(e, record?.guardian_id)}
                      className="btn btn-light btn-sm mt-2"
                    >
                      {copySuccess ? (
                        <RiCheckLine fill="green" />
                      ) : (
                        <RiFileCopy2Line />
                      )}
                    </button>
                  </span>
                </p>
              </details>
            ))
          )}
        </div>
      </div>
      {students.length > 0 && (
        <div className="pagination-buttons">
          <Paginator
            first={first}
            rows={rows}
            totalRecords={totalPages}
            onPageChange={(e) => changePage(e)}
          />
        </div>
      )}
      <table id="table-2-xls" style={{ display: "none" }}>
        <thead>
          <tr>
            <th>S/N</th>
            <th>Name</th>
            <th>Class</th>
            <th>phone number</th>
            <th>admission no</th>
            <th>special discount</th>
            <th>guardian id</th>
            <th>status</th>
          </tr>
        </thead>
        <tbody>
          {students.length !== 0 &&
            students.map((record, i) => (
              <tr key={i}>
                <td>{i + 1}</td>
                <td>{record.name}</td>
                <td>{record.class}</td>
                <td>{record.phone_number}</td>
                <td>{record.adm_no}</td>
                <td>{record.special}</td>
                <td>{record.guardian_id}</td>
                <td>{record.status}</td>
              </tr>
            ))}
        </tbody>
      </table>
      <ModalCont
        classModal={"search-modal"}
        notShowSave={true}
        title="Search student by Guardian's Name"
      >
        <div className="search-cont">
          <form className="search-container">
            <label htmlFor="g-name">Guardian's Name</label>
            <div className="input-filter-cont">
              <AutoComplete
                value={Gname}
                suggestions={gAutoname}
                completeMethod={(e) => autoGCompleteName(e.query)}
                onChange={(e) => handleSetGName(e)}
                field="guardian_name"
                id="g-name"
                placeholder="Enter Guardians Name to search"
                itemTemplate={gAutoCompleteTemplate}
                onSelect={(e) => handleGAutoClick(e)}
              />
            </div>
            <div className="btn-cont">
              <Button
                onClick={(e) => findGuardian(e)}
                className="p-ripple"
                icon="pi pi-search"
                label="Find"
                size="small"
                severity="success"
              >
                <Ripple />
              </Button>
              <Button
                onClick={(e) => clearG(e)}
                className="p-ripple"
                icon="pi pi-times"
                label="Clear"
                size="small"
                severity="danger"
              >
                <Ripple />
              </Button>
            </div>
          </form>
          <div className="output-search card overflow-x-auto">
            {guardianArr.length !== 0 &&
              guardianArr.map((ind, i) => (
                <OrganizationChart
                  value={[ind]}
                  key={i}
                  nodeTemplate={nodeTemplate}
                />
              ))}
          </div>
        </div>
      </ModalCont>

      <ModalCont
        classModal={"student-add-modal"}
        btn={isLoading2 ? "Add" : "Add"}
        save={saveStudent}
        title="Add student"
        loading={isLoading2}
      >
        <form action="">
          <div className="input-cont">
            <label htmlFor="add-name">Name</label>
            <InputText
              type="text"
              value={addName}
              id="add-name"
              onChange={(e) => setAddName(e.target.value)}
              placeholder="Type name here"
              autoComplete="off"
            />
          </div>
          <div className="input-cont">
            <label htmlFor="class">Class</label>
            <Dropdown
              value={addStudentClass}
              className="filter-class"
              options={classes}
              placeholder="Select class"
              onChange={(e) => setAddStudentClass(e.value)}
              id="class"
              optionLabel="name"
            ></Dropdown>
          </div>
          <div className="input-cont">
            <label htmlFor="a-g-name">Guardian's Name</label>
            <InputText
              type="text"
              value={guardianName}
              id="a-g-name"
              onChange={(e) => setGuardianName(e.target.value)}
              placeholder="Type Guardian's Name here"
              autoComplete="off"
            />
          </div>
          <div className="input-cont">
            <label htmlFor="g-tel">Phone Number</label>
            <InputText
              type="tel"
              value={tel}
              id="balance-user"
              onChange={(e) => setTel(e.target.value)}
              placeholder="Enter Phone Number of Guradian (Optional)"
              autoComplete="off"
            />
          </div>
          <div className="input-cont last">
            <label htmlFor="give_adm">Assign Adm No</label>
            <div className="d-flex flex-nowrap align-items-center w-100">
              <Checkbox
                checked={giveAdmNo}
                onChange={(e) => setGiveAdmNo(e.target.checked)}
                id="give_adm"
                style={{ marginRight: "1rem" }}
              />
              {giveAdmNo ? (
                loadAdmNo ? (
                  <i className="pi pi-spinner"></i>
                ) : (
                  <InputText
                    type="text"
                    value={lastAdmNo}
                    onChange={(e) => setLastAdmNo(e.target.value)}
                    autoComplete="off"
                    placeholder="Compulsory format. 'JDS/00001'"
                  />
                )
              ) : (
                ""
              )}
            </div>
          </div>
        </form>
      </ModalCont>

      <ModalCont
        title="Update Student Info"
        classModal="edit-modal"
        btn={isLoading3 ? "Update" : "Update"}
        loading={isLoading3}
        save={saveEdit}
      >
        <form action="">
          <div className="input-cont">
            <label htmlFor="update-name">Name</label>
            <InputText
              value={updateName}
              id="update-name"
              onChange={(e) => setUpdateName(e.target.value)}
            />
          </div>
          <div className="input-cont">
            <label htmlFor="update-class">Class</label>
            <Dropdown
              value={updateClass}
              className="filter-class"
              options={classes}
              placeholder="Select a class"
              optionLabel="name"
              id="update-class"
              onChange={(e) => setUpdateClass(e.value)}
            />
          </div>
          <div className="input-cont">
            <label htmlFor="update-g-name">Guardian's Name</label>
            <InputText
              value={updateGuardianName}
              id="update-g-name"
              onChange={(e) => setUpdateGuardianName(e.target.value)}
            />
          </div>
          <div className="input-cont">
            <label htmlFor="update-address">Address</label>
            <InputText
              value={updateAddress}
              id="update-address"
              onChange={(e) => setUpdateAddress(e.target.value)}
              placeholder="Enter Guardian's address"
            />
          </div>
          <div className="input-cont">
            <label htmlFor="tel">Guardian's Tel</label>
            <InputText
              value={updateTel}
              id="tel"
              onChange={(e) => setUpdateTel(e.target.value)}
              placeholder="Enter Phone Number of Guardian"
            />
          </div>
          <div className="input-cont">
            <label htmlFor="g-id">Guardian's ID</label>
            <InputText
              value={UpdateGuardianId}
              id="g-id"
              onChange={(e) => setUpdateGuardianId(e.target.value)}
              placeholder="Guardians ID. All wards of this guardian should have same id"
              onDoubleClick={() => autoKey()}
              title="Double click to get a unique ID only if ID is empty"
            />
          </div>
          <div className="input-cont">
            <label htmlFor="adm">Student Admission No. </label>
            <InputText
              value={updateAdmNo}
              id="adm"
              onChange={(e) => setUpdateAdmNo(e.target.value)}
              placeholder="Student's Admission No"
            />
          </div>
          <div className="input-cont">
            <label htmlFor="discount">Special Discount</label>
            <InputText
              value={updateDiscount}
              id="discount"
              onChange={(e) => setUpdateDiscount(e.target.value)}
              placeholder="Enter scholarship for those on scholarship"
            />
          </div>
          <div className="input-cont last-input-cont">
            <label htmlFor="status">Student Status </label>
            <div>
              <Checkbox
                checked={updatestatus}
                id="status"
                onChange={(e) => setUpdatestatus(e.checked)}
                className="check"
              />
              <small>
                <i>
                  Toggle to switch status. If checked, student is active else,
                  student is not
                </i>
              </small>
            </div>
          </div>
        </form>
      </ModalCont>
      <ModalCont
        title={`Update ${
          selectedAction.length > 1
            ? selectedAction.length + " Students Info"
            : "Student Info"
        }`}
        classModal="edit-multiple-modal"
        btn={isLoading3 ? "Update" : "Update"}
        loading={isLoading3}
        save={saveMultipleEdit}
      >
        <form action="">
          <Message
            text="Leave field blank to retain previous information"
            severity="info"
            icon="pi pi-bell"
          />
          <div className="input-cont">
            <label htmlFor="update-mul-g-name">Guardian's Name</label>
            <InputText
              value={updateGuardianName}
              id="update-mul-g-name"
              onChange={(e) => setUpdateGuardianName(e.target.value)}
            />
          </div>
          <div className="input-cont">
            <label htmlFor="update-mul-class">Class</label>
            <Dropdown
              value={updateClass}
              className="filter-class"
              options={classes}
              placeholder="Select a class"
              optionLabel="name"
              id="update-mul-class"
              onChange={(e) => setUpdateClass(e.value)}
            />
          </div>

          <div className="input-cont">
            <label htmlFor="update-mul-address">Address</label>
            <InputText
              value={updateAddress}
              id="update-mul-address"
              onChange={(e) => setUpdateAddress(e.target.value)}
              placeholder="Enter Guardian's address"
            />
          </div>
          <div className="input-cont">
            <label htmlFor="mul-tel">Guardian's Tel</label>
            <InputText
              value={updateTel}
              id="mul-tel"
              onChange={(e) => setUpdateTel(e.target.value)}
              placeholder="Enter Phone Number of Guardian"
            />
          </div>
          <div className="input-cont">
            <label htmlFor="g-mul-id">Guardian's ID</label>
            <InputText
              value={UpdateGuardianId}
              id="g-mul-id"
              onChange={(e) => setUpdateGuardianId(e.target.value)}
              placeholder="Guardians ID. All wards of this guardian should have same guardian."
              onDoubleClick={() => autoKey()}
              title="Double click to get a unique ID only if ID is empty"
            />
          </div>

          <div className="input-cont">
            <label htmlFor="mul-discount">Special Discount</label>
            <InputText
              value={updateDiscount}
              id="mul-discount"
              onChange={(e) => setUpdateDiscount(e.target.value)}
              placeholder="Enter scholarship for those on scholarship"
            />
          </div>
          <div className="input-cont last-input-cont">
            <label htmlFor="mul-status">Student Status </label>
            <div>
              <Checkbox
                checked={updatestatus}
                id="mul-status"
                onChange={(e) => setUpdatestatus(e.checked)}
                className="check"
              />
              <small>
                <i>
                  Toggle to switch status. If checked, student is active else,
                  student is not
                </i>
              </small>
            </div>
          </div>
        </form>
      </ModalCont>
      <ModalCont
        classModal={"upload-modal"}
        btn={isLoadingUpload ? "Add" : "Add"}
        loading={isLoadingUpload}
        save={saveUpload}
        notShowSave={file.length === 0 ? true : false}
      >
        <div className="preview table-responsive">
          <h4 className="h4">Preview Data</h4>
          <div className="output-search">
            <table className="table table-bordered table-hoverable">
              <thead>
                <tr>
                  <th>NAME</th>
                  <th>CLASS</th>
                  <th>GUARDIAN NAME</th>
                  <th>PHONE NUMBER</th>
                  <th>ADM NO</th>
                  <th>ADDRESS</th>
                  <th>DISCOUNTS</th>
                  <th>GUARDIAN ID</th>
                  <th>STATUS</th>
                </tr>
              </thead>
              <tbody>
                {file.length === 0 ? (
                  <tr>
                    <td colSpan={10}>No data to preiew</td>
                  </tr>
                ) : (
                  file?.map((item) => (
                    <tr key={Math.random()}>
                      <td>{item["NAME"]}</td>
                      <td>{item["CLASS"]}</td>
                      <td>{item["GUARDIAN NAME"]}</td>
                      <td>{item["PHONE NUMBER"]}</td>
                      <td>{item["ADM NO"]}</td>
                      <td>{item["ADDRESS"]}</td>
                      <td>{item["DISCOUNTS"]}</td>
                      <td>{item["GUARDIAN ID"]}</td>
                      <td>{item["STATUS"]}</td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
            <ScrollTop
              target="parent"
              threshold={100}
              className="w-2rem border-round"
              icon="pi pi-arrow-up text-base"
              style={{ transform: "scale(.8)" }}
            />
          </div>
        </div>
      </ModalCont>
      <table id="table-to-xls" style={{ display: "none" }}>
        <thead>
          <tr>
            <th>NAME</th>
            <th>CLASS</th>
            <th>GUARDIAN NAME</th>
            <th>PHONE NUMBER</th>
            <th>ADM NO</th>
            <th>ADDRESS</th>
            <th>DISCOUNTS</th>
            <th>GUARDIAN ID</th>
            <th>STATUS</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>
              Make no alterations to the headers. Leave empty if no value. Do
              not add any extra column to this worksheet.
            </td>
            <td>classes should be entered in relation on what is on the app</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>set 'none' as default value</td>
            <td></td>
            <td>values are 'active' and 'left'</td>
          </tr>
        </tbody>
      </table>
      <ReactHTMLTableToExcel
        style={{ display: "none" }}
        id="xls-button-2"
        className="xls-button btn btn-light btn-sm ml-3 d-none"
        table="table-2-xls"
        filename={"class list"}
        sheet="sheet 1"
        buttonText="Download Template"
      />
    </div>
  );
};
export default Students;
