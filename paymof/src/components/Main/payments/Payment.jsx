import {
  useContext,
  useEffect,
  useRef,
  useState,
  useTransition,
  useId,
} from "react";
import "./payment.css";
import { MainContext } from "../Helpers/Context";
import ModalCont from "../../small_comps/modal/ModalCont";
import toast, { Toaster } from "react-hot-toast";
import { Calendar } from "primereact/calendar";
import { InputNumber } from "primereact/inputnumber";
import { Button } from "primereact/button";
import { Ripple } from "primereact/ripple";
import { AutoComplete } from "primereact/autocomplete";
import { Dropdown } from "primereact/dropdown";
import { Toast } from "primereact/toast";
import { Link } from "react-router-dom";
const Payment = () => {
  let uniqueId = useId();
  let { url, loggedUser, notifications, io, logo, loggedSchool } =
    useContext(MainContext);
  let randomNumber = `${Math.floor(Math.random() * 99999)}`.padStart(
    5,
    Math.floor(Math.random() * 99999)
  );
  const [autoFees, setAutoFees] = useState("");
  const convertDate = (date) => {
    return [
      date.getUTCFullYear(),
      date.getUTCMonth() + 1 < 10
        ? `0${date.getUTCMonth() + 1}`
        : date.getUTCMonth() + 1,
      date.getDate() < 10 ? `0${date.getDate()}` : date.getDate(),
    ].join("/");
  };
  // eslint-disable-next-line no-unused-vars
  const [isPending, startTransition] = useTransition();
  const [name, setName] = useState("");
  const [autoName, setAutoName] = useState([]);
  const [studentClass, setStudentClass] = useState({ name: "" });
  const [classesArray, setClassesArray] = useState([]);
  const [DOG, setDOG] = useState(new Date());
  const [paymentId, setPaymentId] = useState(randomNumber);
  const [DOP, setDOP] = useState("");
  const [term, setTerm] = useState("");
  const [termArray, setTermArray] = useState([]);
  const [paymentMethod, setPaymentMethod] = useState("");
  const [paymentFor, setPaymentFor] = useState("");
  const [totalFee, setTotalFee] = useState(0);
  const [feePaid, setFeePaid] = useState(0);
  const [balance, setBalance] = useState(0);
  const [DOB, setDOB] = useState("");
  const [remark, setRemark] = useState("");
  const [session, setSession] = useState("");
  const [sessionArray, setSessionArray] = useState([]);
  const [error, setError] = useState("");
  const [paymentForArr, setPaymentForArr] = useState([]);
  const [paymentMethodArr, setPaymentMethodArr] = useState([]);
  const [showDOB, setshowDOB] = useState(false);
  const [ErrArr, setErrArr] = useState([]);
  const [PTA, setPTA] = useState("");
  const [lesson, setLesson] = useState("");
  const [viewName, setViewName] = useState("");
  const [viewClass, setViewClass] = useState("");
  const [viewPaymentId, setViewPaymentId] = useState("");
  const [viewTotal, setViewTotal] = useState("");
  const [viewBalance, setViewBalance] = useState("");
  const [viewRemark, setViewRemark] = useState([]);
  const [amountsPaid, setamountsPaid] = useState([]);
  const [totalPaid, setTotalPaid] = useState(0);
  const [saveTimes, setSaveTimes] = useState(0);
  const [wallets, setWallets] = useState([]);
  const [defaultWallet, setDefaultWallet] = useState("");
  const viewdate = useRef([]);
  const [specialDiscount, setspecialDiscount] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [printLoading, setPrintLoading] = useState(false);
  const toastRef = useRef(null);
  const displayOnce = useRef(0);
  const displayOnce2 = useRef(0);
  const [accountant, setAccountant] = useState("");
  const [studentId, setStudentId] = useState("");
  const [admNo, setAdmNo] = useState("");
  const [isThereBalance, setIsThereBalance] = useState(false);
  const [format] = useState(false);
  const [isSelectFromDropdown, setIsSelectFormDropdown] = useState(false);
  // const displayOnce = useRef(0)
  useEffect(() => {
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
          newCls = data?.message[0];
          startTransition(() => {
            try {
              let testClass = JSON.parse(newCls.classes);
              let testTerm = data?.message[0]?.terms?.split(",");
              let testSession = data?.message[0]?.sessions?.split(",");
              let testPaymentFor = newCls.payment_for?.split(",");
              let testMethod = newCls.payment_method?.split(",");
              let testWallet = new Map(JSON?.parse(newCls?.wallets));

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
                testPaymentFor = await testPaymentFor.map((paymentFor) => {
                  return { name: paymentFor.toUpperCase() };
                });
                testMethod = await testMethod.map((methodFor) => {
                  return { name: methodFor.toUpperCase() };
                });
                testWallet = await [...testWallet].map((wallet) => {
                  return { name: wallet[0].toUpperCase() };
                });
                return {
                  testClass,
                  testTerm,
                  testSession,
                  testPaymentFor,
                  testMethod,
                  testWallet,
                };
              };
              // setClasses(setClass().then((data) => data));
              setClass().then(
                ({
                  testClass,
                  testTerm,
                  testSession,
                  testPaymentFor,
                  testMethod,
                  testWallet,
                }) => {
                  setClassesArray(testClass);
                  setTermArray(testTerm);
                  setSessionArray(testSession);
                  setPaymentForArr(testPaymentFor);
                  setPaymentMethodArr(testMethod);
                  setWallets(testWallet);
                }
              );
              setSession({
                name: data?.message[0]?.current_session?.toUpperCase(),
              });
              setTerm({ name: data?.message[0]?.current_term.toUpperCase() });

              setAutoFees(new Map(JSON?.parse(newCls?.fees)));
              setDefaultWallet({
                name: newCls?.default_wallets?.toUpperCase(),
              });
            } catch {
              notifications.warning("Failed to set data", uniqueId);
            }
          });
        }
      })

      .catch((err) => console.log(err));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [document.readyState]);

  let changeClass = (e) => {
    setStudentClass(e?.value);
    if (e.value.name !== "undefined") {
      autoTotal(e?.value.name);
    } else {
      autoTotal(e?.value);
    }
  };
  let setNameFnc = (e) => {
    if (e.value?.name !== undefined) {
      setName(e.value.name);
    } else {
      setName(e.value);
    }
    toastRef.current.clear();
    setIsThereBalance(false);
    setIsSelectFormDropdown(false);
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
  let autoTotal = (student, returnName = false) => {
    try {
      let splitName = student?.split(" ");
      if (format) {
        if (
          splitName[splitName.length - 1]?.toLowerCase().includes("mercury") ||
          splitName[splitName.length - 1]?.toLowerCase().includes("venus") ||
          splitName[splitName.length - 1]?.toLowerCase().includes("mars") ||
          splitName[splitName.length - 1]?.toLowerCase().includes("jupiter") ||
          splitName[splitName.length - 1]?.toLowerCase().includes("earth")
        ) {
          splitName = splitName?.splice(0, 3);
          if (
            splitName?.length > 1 &&
            splitName[0]?.toLowerCase() === "kindergarten"
          ) {
            splitName = splitName?.splice(0, 1);
          }
        }
        if (splitName[0].toLowerCase() === "nursery" && splitName.length > 2) {
          if (splitName.join(" ").toLowerCase().includes("admission"));
          else splitName.pop();
        }
        if (
          splitName[0].toLowerCase().startsWith("ss") &&
          splitName[0].length >= 2
        ) {
          let newSplitName = [splitName[0], splitName[1]];
          splitName = newSplitName;
        }
        if (splitName[0].toLowerCase() === "pre" && splitName.length > 2) {
          splitName.pop();
        }
      }

      autoFees?.has(splitName?.join(" ")?.toLowerCase()) &&
        setTotalFee(autoFees?.get(splitName?.join(" ")?.toLowerCase()));
      let lesson_name = [...splitName];
      let pta_name = [...splitName];
      lesson_name.push("LESSON");
      pta_name.push("PTA");
      // console.log(splitName);
      if (autoFees.has(lesson_name?.join(" ")?.toLowerCase()))
        setLesson(autoFees.get(lesson_name?.join(" ")?.toLowerCase()));
      else setLesson("");
      if (autoFees.has(pta_name?.join(" ")?.toLowerCase()))
        setPTA(autoFees.get(pta_name?.join(" ")?.toLowerCase()));
      else setPTA("");
      if (returnName) {
        return splitName;
      }
    } catch (error) {
      console.log(error);
    }
  };
  let autoLesson = (student) => {
    try {
      let splitName = student?.split(" ");

      if (format) {
        if (
          splitName[splitName.length - 1]?.toLowerCase().includes("mercury") ||
          splitName[splitName.length - 1]?.toLowerCase().includes("venus") ||
          splitName[splitName.length - 1]?.toLowerCase().includes("mars") ||
          splitName[splitName.length - 1]?.toLowerCase().includes("jupiter") ||
          splitName[splitName.length - 1]?.toLowerCase().includes("earth")
        ) {
          splitName = splitName?.splice(0, 3);
          if (
            splitName?.length > 1 &&
            splitName[0]?.toLowerCase() === "kindergarten"
          ) {
            splitName = splitName?.splice(0, 1);
          }
        }
        if (splitName[0].toLowerCase() === "nursery" && splitName.length > 2) {
          console.log();
          if (splitName.join(" ").toLowerCase().includes("admission"));
          else splitName.pop();
        }
        if (
          splitName[0].toLowerCase().startsWith("ss") &&
          splitName[0].length >= 2
        ) {
          let newSplitName = [splitName[0], splitName[1]];
          splitName = newSplitName;
        }
        if (splitName[0].toLowerCase() === "pre" && splitName.length > 2) {
          splitName.pop();
        }
      }
      autoFees?.has(splitName?.join(" ")?.toLowerCase()) &&
        setTotalFee(autoFees?.get(splitName?.join(" ")?.toLowerCase()));
      let lesson_name = [...splitName];
      let pta_name = [...splitName];
      lesson_name.push("LESSON");
      pta_name.push("PTA");
      // console.log(splitName);
      if (autoFees.has(lesson_name?.join(" ")?.toLowerCase()))
        setLesson(autoFees.get(lesson_name?.join(" ")?.toLowerCase()));
      else setLesson("");
      if (autoFees.has(pta_name?.join(" ")?.toLowerCase()))
        setPTA(autoFees.get(pta_name?.join(" ")?.toLowerCase()));
      else setPTA("");
    } catch (error) {
      console.log(error);
    }
  };
  let changePaymentFor = (e) => {
    setPaymentFor(e?.value);
    autoTotal(e?.value.name);
    setDefaultWallet({ name: "CURRENT" });
    if (e?.value?.name.includes("PART PAYMENT")) {
      setshowDOB(true);
    } else {
      setshowDOB(false);
    }

    if (
      e.value.name.toLowerCase().startsWith("fees") ||
      e.value.name.toLowerCase().includes("part payment")
    ) {
      // console.log("hi");
      autoLesson(studentClass.name?.toLowerCase().trim());
    } else {
      setPTA(0);
      setLesson(0);
    }

    if (e.value.name.toLowerCase().includes("no lesson")) {
      // console.log("hi");
      try {
        let name = autoTotal(studentClass.name?.toLowerCase().trim(), true);
        let deduction =
          parseInt(totalFee) - autoFees.get(name.join(" ") + " lesson") || 0;
        if (
          deduction !== "undefined" &&
          deduction !== null &&
          deduction !== ""
        ) {
          setTotalFee(deduction);
          setLesson(0);
        }
      } catch (error) {
        console.log(error);
      }
    }
    if (
      e.value.name.toLowerCase().includes("waec") ||
      e.value.name.toLowerCase().includes("neco") ||
      e.value.name.toLowerCase().includes("others")
    ) {
      // console.log("hi");
      setPTA(0);
      setLesson(0);
    }
    if (e.value.name.toLowerCase().startsWith("pta")) {
      // console.log("hi");
      setPTA(autoFees.get("PTA"));
      setLesson(0);
    }
    if (e.value.name.toLowerCase().includes("bus")) {
      setPTA(0);
      setLesson(0);
      let wallet = wallets.find((wallet) =>
        wallet.name.toLowerCase().includes("bus")
      );
      // console.log(wallet);
      wallets !== undefined
        ? setDefaultWallet({ name: wallet.name })
        : setDefaultWallet({ name: "CURRENT" });
    }
    if (e.value.name.toLowerCase().startsWith("pta")) {
      setPTA(0);
      setLesson(0);
      let wallet = wallets.find((wallet) =>
        wallet.name.toLowerCase().startsWith("pta")
      );
      // console.log(wallet);
      wallets !== undefined
        ? setDefaultWallet({ name: wallet.name })
        : setDefaultWallet({ name: "CURRENT" });
    }
  };
  useEffect(() => {
    if (feePaid) {
      if (parseInt(feePaid) > parseInt(totalFee)) {
        notifications?.warning("advance is greater than balance");
        setErrArr(["advance is greater than balance"]);
        setFeePaid(0);
        setBalance(0);
      } else {
        setBalance(parseInt(totalFee) - parseInt(feePaid));
        setErrArr([]);
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [totalFee]);

  let feePaidFnc = (e) => {
    setFeePaid(e?.value);
    if (parseInt(e?.value) > parseInt(totalFee)) {
      notifications.warning("Advance is greater than balance", uniqueId);
      setErrArr(["advance is greater than balance"]);
      setBalance(parseInt(totalFee) - parseInt(e?.value));
    } else {
      setBalance(parseInt(totalFee) - parseInt(e?.value));
      setErrArr([]);
    }
  };

  let autoRemark = () => {
    if (
      term.name &&
      paymentFor.name &&
      paymentMethod.name &&
      feePaid !== 0 &&
      feePaid !== ""
    ) {
      if (balance > 0) {
        setRemark(
          `PART PAYMENT MADE FOR ${term.name} - ${
            studentClass?.name || ""
          }, THROUGH ${paymentMethod.name} (${session.name}) ${
            specialDiscount !== "" && specialDiscount?.toLowerCase() !== "none"
              ? specialDiscount
              : ""
          }`
        );
      }
      if (balance === 0) {
        setRemark(
          `${term.name} PAYMENT FOR ${paymentFor.name} - ${
            studentClass?.name || ""
          }, THROUGH ${paymentMethod.name} (${session.name}) ${
            specialDiscount !== "" &&
            specialDiscount?.toLowerCase() !== "none" &&
            paymentFor.name?.toLowerCase() !== "busfare"
              ? specialDiscount
              : ""
          }`
        );
      }
      if (balance === 0 && paymentFor.name.toLowerCase() === "part payment") {
        setRemark(
          `${term.name} ${paymentFor.name} - ${
            studentClass?.name || ""
          } MADE, THROUGH ${paymentMethod.name} (${session.name}) ${
            specialDiscount !== "" &&
            specialDiscount?.toLowerCase() !== "none" &&
            paymentFor.name?.toLowerCase() !== "busfare"
              ? "(" + specialDiscount + ")"
              : ""
          }`
        );
      }
      if (paymentFor.name.toLowerCase().includes("bus")) {
        setRemark(
          `${term.name} PAYMENT MADE FOR ${paymentFor.name} - ${
            studentClass?.name || ""
          } THROUGH ${paymentMethod.name} (${session.name}) ${
            specialDiscount !== "" &&
            specialDiscount?.toLowerCase() !== "none" &&
            paymentFor.name?.toLowerCase() !== "busfare"
              ? "(" + specialDiscount + ")"
              : ""
          }`
        );
      }
    }
  };
  const onBlurAutocomplete = () => {
    if (!isSelectFromDropdown) setName("");
  };
  const findName = (name) => {
    name?.length > 1
      ? startTransition(() =>
          fetch(`${url}/main/payment/findName`, {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            credentials: "include",
            body: JSON.stringify({ name }),
          })
            .then((res) => res.json())
            .then((data) => {
              if (data?.status) {
                setAutoName(data?.message);
              }
            })
            .catch((err) => console.log(err))
        )
      : setAutoName([]);
  };
  const clickAutoName = (details) => {
    setIsSelectFormDropdown(true);
    setName(details?.name?.toUpperCase());
    setStudentClass({ name: details?.class?.toUpperCase() });
    autoTotal(details?.class?.toUpperCase());
    setspecialDiscount(details?.discounts?.toUpperCase());
    setAdmNo(details?.adm_no);
    setStudentId(details?.id);
    setAutoName([]);
    // autoTotal(details.name?.toUpperCase());
    displayOnce.current = 0;
    displayOnce2.current = 0;
    findBalance(
      details.id,
      details.name.toLowerCase().trim(),
      details?.class?.toLowerCase().trim()
    );
  };
  const findBalance = (id, name, classes) => {
    if (name !== "") {
      io.emit("check_balance", {
        id: id,
        loggedSchool: loggedSchool.trim().toLowerCase(),
        loggedUser,
      });
      io.emit("check_any_payment", {
        id: id,
        loggedSchool: loggedSchool.trim().toLowerCase(),
        loggedUser,
        term: term?.name,
        classes,
        session: session.name,
      });
    }
  };
  const handleSave = (e) => {
    e.preventDefault();
    if (
      name === "" ||
      paymentId === "" ||
      studentClass.name === "" ||
      DOP === "" ||
      DOP === null ||
      DOG === "" ||
      DOG === null ||
      paymentFor.name === "" ||
      paymentMethod.name === "" ||
      term.name === "" ||
      totalFee === "" ||
      totalFee === 0 ||
      feePaid === "" ||
      feePaid === 0 ||
      remark === "" ||
      balance === ""
    ) {
      setError("All fields are required");
      notifications.warning("All fields are required", uniqueId);
      return;
    } else {
      setError("");
      setIsLoading(false);
      if (parseInt(balance) > 0 && DOB === "") {
        setshowDOB(true);
        toast.error("Set balance date", { id: uniqueId });
        return;
      } else {
        if (ErrArr.length > 0) {
          setIsLoading(false);
          notifications.warning(ErrArr[0], uniqueId);
          return;
        } else {
          if (
            PTA === "" ||
            lesson === "" ||
            PTA === null ||
            lesson === null ||
            PTA === undefined ||
            lesson === undefined
          ) {
            setIsLoading(false);
            toast("Set PTA and lesson deduction", { id: uniqueId, icon: "⚠" });
            showModal();
            return;
          } else {
            if (isThereBalance) {
              notifications.confirm(
                "This student has a previous outstanding. Do you want to continue?",
                () => {
                  let datas = {
                    name,
                    paymentId,
                    studentClass: studentClass.name,
                    studentId,
                    DOP: convertDate(new Date(DOP)),
                    DOB: DOB !== "" ? convertDate(new Date(DOB)) : "",
                    DOG: DOB !== "" ? convertDate(new Date(DOG)) : "",
                    lesson,
                    PTA,
                    paymentFor: paymentFor.name,
                    paymentMethod: paymentMethod.name,
                    term: term.name,
                    totalFee,
                    feePaid,
                    balance,
                    remark,
                    session: session.name,
                    loggedUser,
                    defaultWallet: defaultWallet.name,
                  };
                  notifications.loading("Saving...", uniqueId);
                  fetch(`${url}/main/payment/save`, {
                    method: "POST",
                    headers: {
                      "Content-Type": "application/json",
                    },
                    credentials: "include",
                    body: JSON.stringify({ datas }),
                  })
                    .then((res) => res.json())
                    .then((data) => {
                      // toast.dismiss(uniqid);
                      setIsLoading(false);
                      if (!data.status) {
                        setError(data.message);
                        notifications.warning(data.message, uniqueId);
                      } else {
                        setError("");
                        notifications.success("Success", uniqueId);
                        io.emit("display_notification", {
                          type: "others",
                          name: name.toLowerCase(),
                          payment_id: paymentId,
                          amount_paid: feePaid,
                        });
                        reset();
                        document
                          .getElementsByClassName("__payment")[0]
                          .scrollIntoView();
                      }
                    })
                    .catch((err) => {
                      // toast.dismiss(uniqid);
                      notifications.warning(
                        "Failed to save payment. Try refreshing",
                        uniqueId
                      );
                      setIsLoading(false);
                      console.log(err);
                    });
                },
                () => {
                  return;
                },
                []
              );
            } else {
              let datas = {
                name,
                paymentId,
                studentClass: studentClass.name,
                studentId,
                DOP: convertDate(new Date(DOP)),
                DOB: DOB !== "" ? convertDate(new Date(DOB)) : "",
                DOG: DOB !== "" ? convertDate(new Date(DOG)) : "",
                lesson,
                PTA,
                paymentFor: paymentFor.name,
                paymentMethod: paymentMethod.name,
                term: term.name,
                totalFee,
                feePaid,
                balance,
                remark,
                session: session.name,
                loggedUser,
                defaultWallet: defaultWallet.name,
              };
              notifications.loading("Saving...", uniqueId);
              fetch(`${url}/main/payment/save`, {
                method: "POST",
                headers: {
                  "Content-Type": "application/json",
                },
                credentials: "include",
                body: JSON.stringify({ datas }),
              })
                .then((res) => res.json())
                .then((data) => {
                  // toast.dismiss(uniqid);
                  setIsLoading(false);
                  if (!data.status) {
                    setError(data.message);
                    notifications.warning(data.message, uniqueId);
                  } else {
                    setError("");
                    notifications.success("Success", uniqueId);
                    io.emit("display_notification", {
                      type: "others",
                      name: name.toLowerCase(),
                      payment_id: paymentId,
                      amount_paid: feePaid,
                    });
                    reset();
                    document
                      .getElementsByClassName("__payment")[0]
                      .scrollIntoView();
                  }
                })
                .catch((err) => {
                  // toast.dismiss(uniqid);
                  notifications.warning(
                    "Failed to save payment. Try refreshing",
                    uniqueId
                  );
                  setIsLoading(false);
                  console.log(err);
                });
            }
          }
        }
      }
    }
  };
  const reset = () => {
    setName("");
    setStudentClass("");
    setPaymentId(
      `${Math.floor(Math.random() * 99999)}`.padStart(
        5,
        Math.floor(Math.random() * 99999)
      )
    );
    setSaveTimes(0);
    setDOP("");
    setPaymentMethod("");
    setPaymentFor("");
    setTotalFee(0);
    setFeePaid(0);
    setBalance(0);
    setDOB("");
    setRemark("");
    setError("");
    setshowDOB(false);
    setAutoName([]);
    setPTA("");
    setLesson("");
    setDefaultWallet({ name: "CURRENT" });
    setIsThereBalance(false);
    toastRef.current.clear();
    setIsSelectFormDropdown(false);
  };
  let showPrint = (key) => {
    if (key) {
      fetch(`${url}/main/records/get-view?key=${key}`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
      })
        .then((res) => res.json())
        .then((data) => {
          if (data.status) {
            let remarks = [];
            let amountPaidArr = [];
            let dateArr = [];
            let totalPaid1 = 0;
            let DOGArr = [];
            setViewName(data.message[0].name);
            setViewClass(data.message[0].class);
            setViewPaymentId(data.message[0].payment_id);
            setViewTotal(data.message[0].expected_payment);
            setViewBalance(data.message[0].balance);
            setAccountant(data.message[0].accountant);
            setAdmNo(data.adm);
            if (data.message.length > 1) {
              data.message.forEach((details) => {
                dateArr.push(details.DOP);
                remarks.push(details.remark);
                amountPaidArr.push(details.amount_paid);
                totalPaid1 += parseInt(details.amount_paid);
                DOGArr.push(details.created_at);
              });
              setViewRemark(remarks);
              setamountsPaid(amountPaidArr);
              setTotalPaid(totalPaid1);
              viewdate.current = dateArr;
            } else {
              setViewRemark([data.message[0].remark]);
              viewdate.current = [data.message[0].DOP];
              setamountsPaid([data.message[0].amount_paid]);
              setTotalPaid(data.message[0].amount_paid);
              setDOG([data.message[0].created_at]);
            }
            reset();
            document
              .getElementsByClassName("print-modal")[0]
              .classList.add("show-modal");
            document.body.style.overflow = "hidden";
            window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
          } else {
            notifications.warning(data.message, uniqueId);
          }
        })
        .catch((err) => console.log(err));
    }
  };
  const handlePrint = (e) => {
    e.preventDefault();
    if (saveTimes === 0) {
      if (
        name === "" ||
        paymentId === "" ||
        studentClass.name === "" ||
        DOP === "" ||
        DOP === null ||
        DOG === "" ||
        DOG === null ||
        paymentFor.name === "" ||
        paymentMethod.name === "" ||
        term.name === "" ||
        totalFee === "" ||
        totalFee === 0 ||
        feePaid === "" ||
        feePaid === 0 ||
        remark === "" ||
        balance === ""
      ) {
        setError("All fields are required");
        notifications.warning("All fields are required", uniqueId);
      } else {
        setError("");
        setPrintLoading(false);

        if (parseInt(balance) > 0 && DOB === "") {
          setshowDOB(true);
          toast.error("Set balance date", { id: uniqueId });
          return;
        } else {
          if (ErrArr.length > 0) {
            setPrintLoading(false);
            notifications.warning(ErrArr[0], uniqueId);
            return;
          } else {
            if (
              PTA === "" ||
              lesson === "" ||
              PTA === null ||
              lesson === null ||
              PTA === undefined ||
              lesson === undefined
            ) {
              setPrintLoading(false);
              toast("Set PTA and lesson deduction", {
                id: uniqueId,
                icon: "⚠",
              });
              showModal();
              return;
            } else {
              if (isThereBalance) {
                notifications.confirm(
                  "This student has a previous outstanding. Do you want to continue?",
                  () => {
                    let datas = {
                      name,
                      paymentId,
                      studentId,
                      studentClass: studentClass.name,
                      DOP: convertDate(new Date(DOP)),
                      DOB: DOB !== "" ? convertDate(new Date(DOB)) : "",
                      DOG: DOB !== "" ? convertDate(new Date(DOG)) : "",
                      lesson,
                      PTA,
                      paymentFor: paymentFor.name,
                      paymentMethod: paymentMethod.name,
                      term: term.name,
                      totalFee,
                      feePaid,
                      balance,
                      remark,
                      session: session.name,
                      loggedUser,
                      defaultWallet: defaultWallet.name?.toLowerCase(),
                    };
                    setPrintLoading(true);
                    notifications.loading("saving", uniqueId);

                    fetch(`${url}/main/payment/save`, {
                      method: "POST",
                      headers: {
                        "Content-Type": "application/json",
                      },
                      credentials: "include",
                      body: JSON.stringify({ datas }),
                    })
                      .then((res) => res.json())
                      .then((data) => {
                        setPrintLoading(false);
                        setIsThereBalance(false);
                        if (!data.status) {
                          setError(data.message);
                          notifications.warning(data.message, uniqueId);
                        } else {
                          setError("");
                          notifications.success("Success!", uniqueId);
                          io.emit("display_notification", {
                            type: "others",
                            name: name.toLowerCase(),
                            payment_id: paymentId,
                            amount_paid: feePaid,
                          });
                          showPrint(data.key_id);
                          document
                            .getElementsByClassName("__payment")[0]
                            .scrollIntoView();
                          setSaveTimes(1);
                          reset();
                        }
                      })
                      .catch((err) => {
                        setPrintLoading(false);
                        console.log(err);
                        notifications.warning(
                          "Failed to save payment. Try refreshing"
                        );
                      });
                  },
                  () => {
                    return;
                  },
                  []
                );
              } else {
                let datas = {
                  name,
                  paymentId,
                  studentClass: studentClass.name,
                  studentId,
                  DOP: convertDate(new Date(DOP)),
                  DOB: DOB !== "" ? convertDate(new Date(DOB)) : "",
                  DOG: DOB !== "" ? convertDate(new Date(DOG)) : "",
                  lesson,
                  PTA,
                  paymentFor: paymentFor.name,
                  paymentMethod: paymentMethod.name,
                  term: term.name,
                  totalFee,
                  feePaid,
                  balance,
                  remark,
                  session: session.name,
                  loggedUser,
                  defaultWallet: defaultWallet.name?.toLowerCase(),
                };
                setPrintLoading(true);
                notifications.loading("saving", uniqueId);
                fetch(`${url}/main/payment/save`, {
                  method: "POST",
                  headers: {
                    "Content-Type": "application/json",
                  },
                  credentials: "include",
                  body: JSON.stringify({ datas }),
                })
                  .then((res) => res.json())
                  .then((data) => {
                    setPrintLoading(false);
                    setIsThereBalance(false);

                    if (!data.status) {
                      setError(data.message);
                      notifications.warning(data.message, uniqueId);
                    } else {
                      setError("");
                      notifications.success("Success!", uniqueId);
                      toast.dismiss(uniqueId);
                      io.emit("display_notification", {
                        type: "others",
                        name: name.toLowerCase(),
                        payment_id: paymentId,
                        amount_paid: feePaid,
                      });
                      showPrint(data.key_id);
                      document
                        .getElementsByClassName("__payment")[0]
                        .scrollIntoView();
                      setSaveTimes(1);
                      reset();
                    }
                  })
                  .catch((err) => {
                    setPrintLoading(false);
                    console.log(err);
                    notifications.warning(
                      "Failed to save payment. Try refreshing"
                    );
                  });
              }
            }
          }
        }
      }
    } else {
      notifications.confirm(
        "Already saved. Do you want to save again?",
        handlePrint,
        () => {
          return 0;
        }
      );
    }
  };
  let dob = () => {
    if (feePaid > 0) {
      if (ErrArr?.length === 0 && parseInt(totalFee) - parseInt(feePaid) > 0) {
        setshowDOB(true);
      }
      if (ErrArr.length === 0 && parseInt(totalFee) - parseInt(feePaid) === 0) {
        setshowDOB(false);
      }
    } else {
      setshowDOB(false);
    }
    if (parseInt(feePaid) > parseInt(totalFee)) {
      notifications.warning("Advance is greater than balance", uniqueId);
      setErrArr(["advance is greater than balance"]);
      setBalance(parseInt(totalFee) - parseInt(feePaid));
    } else {
      setBalance(parseInt(totalFee) - parseInt(feePaid));
      setErrArr([]);
    }
  };
  let autoAdvance = () => {
    if (totalFee) {
      setFeePaid(totalFee);
    }
  };
  let setDOBFnc = (e) => {
    if (new Date(e.value) < new Date(Date.now())) {
      notifications.warning(
        "Balance Date is should be in the future",
        uniqueId
      );
      return;
    } else {
      setDOB(e.value);
    }
  };
  let showModal = () => {
    document
      .getElementsByClassName("set-lesson")[0]
      .classList.add("show-modal");
    document.body.style.overflow = "hidden";
    window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
  };
  let closeModal = () => {
    document
      .getElementsByClassName("set-lesson")[0]
      .classList.remove("show-modal");
    document.body.style.overflow = "auto";
    document.body.style.top = "";
    document.getElementsByClassName("payment_for")[0].scrollIntoView();
  };
  let handlePrint2 = () => {
    window.print();
  };
  let formatter = new Intl.NumberFormat(undefined, {
    minimumFractionDigits: 0,
    maximumFractionDigits: 2,
  });
  useEffect(() => {
    io.on("return_balance", ({ data }) => {
      if (data.length > 0) {
        let arr = data[data.length - 1];
        if (arr.name) {
          setIsThereBalance(true);
          if (displayOnce.current === 0) {
            let message = `${arr.name
              .split(" ")
              .map((name) => name.charAt(0).toUpperCase() + name.slice(1))
              .join(" ")} of ${arr.class
              .split(" ")
              .map((clas) => clas.charAt(0).toUpperCase() + clas.slice(1))
              .join(" ")} has an outstanding balance of ${formatter.format(
              arr.balance
            )} for ${arr.term
              .split(" ")
              .map((ter) => ter.charAt(0).toUpperCase() + ter.slice(1))
              .join(" ")}, ${arr.session}. Paid a total of ${formatter.format(
              arr.total
            )}. Receipt number: ${arr.payment_id}.`;
            toastRef.current.show({
              severity: "info",
              summary: "info",
              life: 60000,
              className: "border-none",
              content: (
                <div className="d-flex flex-column align-items-center">
                  <div className="text-center">
                    <i
                      className="pi pi-exclamation-triangle"
                      style={{ fontSize: "3rem" }}
                    ></i>
                    <div className="font-bold text-xl my-3">
                      {message}{" "}
                      <Link to={`../fees?id=${arr.keyid}`}>Goto Payment</Link>
                    </div>
                  </div>
                </div>
              ),
            });
            displayOnce.current += 1;
          }
        }
      } else {
        setIsThereBalance(false);
      }
    });
    io.on("return_any_fee", ({ data }) => {
      if (data?.length > 0) {
        // let arr = data[0];
        // console.log(arr);
        data.forEach((arr) => {
          console.log(arr);
          let message = `${arr.name
            .split(" ")
            .map((name) => name.charAt(0).toUpperCase() + name.slice(1))
            .join(" ")} of ${arr.class
            .split(" ")
            .map((clas) => clas.charAt(0).toUpperCase() + clas.slice(1))
            .join(" ")} has a payment for this term ${arr.term
            .split(" ")
            .map((ter) => ter.charAt(0).toUpperCase() + ter.slice(1))
            .join(" ")}, ${arr.session}, ${
            arr?.payment_for
          }. Paid a total of ${formatter.format(arr.total)}. Receipt number: ${
            arr.payment_id
          }.`;
          toastRef.current.show({
            severity: "warn",
            summary: "Warning",
            life: 80000,
            className: "border-none",
            detail: message,
            position: "top-left",
          });
          displayOnce2.current += 1;
        });
      }
    });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [io]);
  return (
    <div className="__payment">
      <div>
        <Toast ref={toastRef} position="top-right" />
        <Toaster position="top-center" reverseOrder={false} />
      </div>
      <h2>Make Payment</h2>
      <div style={{ color: "red" }}>{error && error}</div>
      <form>
        <div className="refresh">
          {" "}
          <i
            title="refresh"
            onClick={() => reset()}
            className="pi pi-refresh"
          ></i>
        </div>
        <div className="input-cont">
          <label htmlFor="name">Name</label>
          <div className="input-autocomplete-cont">
            <AutoComplete
              value={name}
              suggestions={autoName}
              completeMethod={(e) => findName(e.query)}
              onChange={(e) => setNameFnc(e)}
              field="name"
              itemTemplate={autoCompleteTemplate}
              id="name"
              placeholder="Name"
              autoFocus={true}
              // forceSelection={true}
              onSelect={(e) => clickAutoName(e.value)}
              onBlur={() => onBlurAutocomplete()}
            />
          </div>
        </div>
        <div className="input-cont">
          <label htmlFor="payment_id">Payment ID</label>
          <input
            type="number"
            name=""
            id="payment_id"
            value={paymentId}
            onChange={(e) => setPaymentId(e?.target?.value)}
          />
        </div>
        <div className="input-cont">
          <label htmlFor="classes">Class</label>
          <Dropdown
            value={studentClass}
            onChange={(e) => changeClass(e)}
            options={classesArray}
            placeholder="Select a class"
            id="class"
            optionLabel="name"
          ></Dropdown>
        </div>
        <input
          hidden
          style={{ fontFamily: "monospace" }}
          type="text"
          value={DOG}
          onChange={(e) => setDOG(e?.target?.value)}
        />
        <div className="input-cont">
          <label htmlFor="date_of_payment">Date Of Payment</label>
          <Calendar
            value={DOP}
            onChange={(e) => setDOP(e?.value)}
            dateFormat="dd/mm/yy"
            showButtonBar
            // icon="pi pi-calendar"
            showIcon
            id="dop"
            placeholder="Select date of payment"
          />
        </div>
        <div className="input-cont">
          <label htmlFor="payment_for">Payment For</label>
          <Dropdown
            value={paymentFor}
            onChange={(e) => changePaymentFor(e)}
            options={paymentForArr}
            placeholder="Payment for?"
            id="payment_for"
            className="payment_for"
            optionLabel="name"
          ></Dropdown>
        </div>
        <div className="input-cont">
          <label htmlFor="payment_method">Payment Method</label>
          <Dropdown
            value={paymentMethod}
            onChange={(e) => setPaymentMethod(e?.value)}
            options={paymentMethodArr}
            placeholder="Payment method"
            id="payment_method"
            optionLabel="name"
          ></Dropdown>
        </div>
        <div className="input-cont">
          <label htmlFor="term">Term</label>
          <Dropdown
            value={term}
            onChange={(e) => setTerm(e.value)}
            options={termArray}
            placeholder="Select Term"
            optionLabel="name"
            id="term"
          ></Dropdown>
        </div>
        <div className="input-cont">
          <label htmlFor="total_fee">Total Fee</label>
          <input
            type="number"
            id="total_fee"
            value={totalFee}
            onChange={(e) => setTotalFee(e?.target.value)}
          />
        </div>
        <div className="input-cont pta">
          <div className="show-pta" onClick={() => showModal()}>
            Deduct PTA and Lesson
          </div>
        </div>
        <div className="input-cont advance">
          <label htmlFor="payment_made">Advance Fee</label>
          <input
            id="payment_made"
            type="number"
            value={feePaid}
            onChange={(e) => feePaidFnc(e.target)}
            onBlur={() => dob()}
            onDoubleClick={() => autoAdvance()}
          />
        </div>
        <div className="input-cont">
          <label htmlFor="balance">Balance</label>
          <input
            type="number"
            id="balance"
            disabled
            value={balance}
            onChange={(e) => setBalance(e?.target.value)}
          />
        </div>
        {showDOB && (
          <div className="input-cont">
            <label htmlFor="date_of_balance">Date Of Balance</label>
            <Calendar
              id="dob"
              value={DOB}
              onChange={(e) => setDOBFnc(e)}
              dateFormat="dd/mm/yy"
              showButtonBar
              placeholder="Select balance date"
              showIcon
            />
          </div>
        )}
        <div className="input-cont">
          <label htmlFor="session">Session</label>
          <Dropdown
            value={session}
            onChange={(e) => setSession(e.value)}
            options={sessionArray}
            placeholder="Select session"
            optionLabel="name"
            id="session"
          ></Dropdown>
        </div>
        <div className="input-cont">
          <label htmlFor="wallet">Select wallet</label>
          <Dropdown
            value={defaultWallet}
            onChange={(e) => setDefaultWallet(e?.value)}
            options={wallets}
            placeholder="Select wallet"
            id="wallet"
            optionLabel="name"
          ></Dropdown>
        </div>
        <div className="input-cont">
          <label htmlFor="remark">Custom Remark</label>
          <textarea
            placeholder="Remark"
            value={remark}
            onChange={(e) => setRemark(e?.target?.value)}
            onDoubleClick={autoRemark}
          ></textarea>
        </div>
        <div className="btn-cont mt-3">
          <Button
            onClick={(e) => handleSave(e)}
            icon="pi pi-check-circle"
            severity="success"
            iconPos="right"
            label="Save"
            // size="small"
            loading={isLoading}
          >
            <Ripple />
          </Button>
          <Button
            onClick={(e) => handlePrint(e)}
            className="p-ripple"
            iconPos="right"
            icon="pi pi-print"
            label="Print"
            // size="small"
            severity="secondary"
            loading={printLoading}
          >
            <Ripple />
          </Button>
        </div>
      </form>

      <ModalCont
        title="Lesson and P.T.A Deduction"
        classModal="set-lesson"
        save={closeModal}
      >
        <form action="">
          <div className="input-cont">
            <label htmlFor="PTA">P.T.A</label>
            <InputNumber
              value={PTA}
              id="PTA"
              onChange={(e) => setPTA(e?.value)}
            />
          </div>
          <div className="input-cont">
            <label htmlFor="lesson">Lesson</label>
            <InputNumber
              value={lesson}
              id="total"
              onChange={(e) => setLesson(e?.value)}
            />
          </div>
        </form>
      </ModalCont>
      <ModalCont
        title={""}
        classModal="print-modal"
        btn="Print"
        save={handlePrint2}
      >
        <div className="print-container">
          <div className="img-cont">
            <img src={logo} alt="logo" />
          </div>
          <h4 className="h5">School Fees Report</h4>
          <div style={{ textAlign: "center" }}>
            DATE & TIME &nbsp; {new Date(Date.now()).toLocaleDateString()}{" "}
            &nbsp; {new Date(Date.now()).toLocaleTimeString()}
          </div>
          <hr />
          <div className="student-info">
            <h4 className="h6">Student Info</h4>
            <div className="table-responsive">
              <table className="table table-bordered">
                <thead>
                  <tr>
                    <th>Name</th>
                    <td>{viewName?.toUpperCase()}</td>
                    <th>Class</th>
                    <td>{viewClass?.toUpperCase()}</td>
                  </tr>
                </thead>
                <thead>
                  <tr>
                    <th>Payment ID</th>
                    <td>{viewPaymentId}</td>
                    <th>DOP</th>
                    <td>{formatDate(viewdate?.current[0])}</td>
                  </tr>
                </thead>
                {admNo !== "" ? (
                  <thead>
                    <tr>
                      <th>Admission No</th>
                      <td>{admNo?.toUpperCase()}</td>
                    </tr>
                  </thead>
                ) : (
                  ""
                )}
              </table>
            </div>
          </div>
          <div className="fee-info">
            <h4 className="h6">Fee Info</h4>
            <div className="table-responsive">
              <table className="table table-bordered">
                <thead>
                  <tr>
                    <th>Date</th>
                    <th>Paid</th>
                    <th>Remark</th>
                  </tr>
                </thead>
                <tbody>
                  {viewRemark &&
                    viewRemark?.map((re, index) => (
                      <tr
                        key={re + Math.random()}
                        title={DOG[index]}
                        className="tr"
                      >
                        <td>{formatDate(viewdate?.current[index])}</td>
                        <td>{Number(amountsPaid[index])?.toLocaleString()}</td>
                        <td className="last">{re?.toUpperCase()}</td>
                      </tr>
                    ))}
                </tbody>
              </table>
            </div>
          </div>
          <div className="others-cont">
            <div className="others">
              <div>Total Fees:</div>&#x20A6;
              {Number(viewTotal)?.toLocaleString()}
            </div>
            <div className="others">
              <div>Total Paid: </div>&#x20A6;
              {Number(totalPaid)?.toLocaleString()}
            </div>
            <div className="others">
              <div>Balance: </div>&#x20A6;
              {Number(viewBalance)?.toLocaleString()}
            </div>
            <div className="others" style={{ textTransform: "capitalize" }}>
              <div>Cashier: </div>
              {accountant}
            </div>
          </div>
        </div>
      </ModalCont>
    </div>
  );
};

export default Payment;
