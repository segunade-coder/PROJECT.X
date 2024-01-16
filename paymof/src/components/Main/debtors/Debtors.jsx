/* eslint-disable no-dupe-keys */
import { useContext, useEffect, useRef, useState } from "react";
import { MainContext } from "../Helpers/Context";
import "./debtors.css";
import ReactHTMLTableToExcel from "react-html-table-to-excel";
import { Dropdown } from "primereact/dropdown";
import { Button } from "primereact/button";
import { Ripple } from "primereact/ripple";
import { useNavigate } from "react-router-dom";
import ModalCont from "../../small_comps/modal/ModalCont";
import toast from "react-hot-toast";
const Debtors = () => {
  const [filteredClass, setFilteredClass] = useState({ name: "" });
  const [classes, setClasses] = useState([]);
  const [terms, setTerms] = useState([]);
  const [sessions, setSessions] = useState([]);
  const [filteredSess, setFilteredSess] = useState({ name: "" });
  const [filteredTerm, setFilteredTerm] = useState({ name: "" });
  const [sort, setSort] = useState({ name: "DEBTORS" });
  const [debtors, setDebtors] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [others, setOthers] = useState([]);
  const [paymentForArr, setPaymentForArr] = useState([]);
  const [overAllTotal, setOverAllTotal] = useState(0);
  let { url, notifications, admin, logo } = useContext(MainContext);
  const navigate = useNavigate();
  const [viewName, setViewName] = useState("");
  const [viewClass, setViewClass] = useState({ name: "" });
  const [viewPaymentId, setViewPaymentId] = useState("");
  const [viewTotal, setViewTotal] = useState("");
  const [viewBalance, setViewBalance] = useState("");
  let viewdate = useRef([]);
  const [admNo, setAdmNo] = useState("");
  // eslint-disable-next-line no-unused-vars
  const [__, setDOG] = useState([]);
  const [viewRemark, setViewRemark] = useState([]);
  const [amountsPaid, setamountsPaid] = useState([]);
  const [totalPaid, setTotalPaid] = useState(0);
  const [accountant, setAccountant] = useState([]);
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
            let testPaymentFor = newCls.payment_for?.split(",");
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
              return { testClass, testTerm, testSession, testPaymentFor };
            };
            // setClasses(setClass().then((data) => data));
            setClass().then(
              ({ testClass, testTerm, testSession, testPaymentFor }) => {
                setClasses(testClass);
                setTerms(testTerm);
                setSessions(testSession);
                setPaymentForArr([
                  { name: "DEBTORS" },
                  { name: "CLEARED" },
                  { name: "ALL" },
                  ...testPaymentFor,
                  { name: "DISCOUNTS" },
                  { name: "LEFT" },
                ]);
              }
            );
            setFilteredSess({
              name: data?.message[0]?.current_session?.toUpperCase(),
            });
            setFilteredTerm({
              name: data?.message[0]?.current_term.toUpperCase(),
            });
          } catch {
            console.log("failed to set datas");
          }
        }
      })

      .catch((err) => console.log(err));
  };
  useEffect(() => {
    fetchFilters();
    return () => {
      setTerms([]);
      setSessions([]);
      setClasses([]);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [document.readyState]);

  let findRecord = (e) => {
    e.preventDefault();
    if (
      // filteredClass.name === "" ||
      filteredTerm.name === "" ||
      filteredSess.name === "" ||
      sort.name === ""
    ) {
      notifications.warning("Enter the necessaey fields", "this");
      return;
    } else {
      setIsLoading(true);
      fetch(`${url}/main/records/debtors`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
        body: JSON.stringify({
          filteredClass: filteredClass.name.toLowerCase(),
          filteredSess: filteredSess.name,
          filteredTerm: filteredTerm.name.toLowerCase(),
          sort: sort.name.toLowerCase(),
        }),
      })
        .then((res) => res.json())
        .then((data) => {
          setIsLoading(false);
          if (data.status) {
            setDebtors(data.message);
            setOthers(data.totalArr);
            if (
              data.message?.length !== "undefined" &&
              data.message?.length > 0
            ) {
              let allAmount = [];
              allAmount = data.message.map((item) => item?.amount_paid || 0);
              setOverAllTotal(() =>
                allAmount.reduce(
                  (accumulator, currentValue) =>
                    Number(accumulator) + Number(currentValue),
                  0
                )
              );
            }
          } else {
            notifications.warning(data.message, "this");
          }
        })
        .catch((err) => {
          setIsLoading(false);
          console.log(err);
        });
    }
  };

  let onBlur = (e, id) => {
    if (e.value != undefined && e.value != "") {
      if (id === "filter-class") {
        document.querySelector(`.${id}`).classList.add("filter");
      }
      if (id === "term") {
        document.getElementById(`${id}`).classList.add("filter");
      }
      if (id === "filter-sess") {
        document.querySelector(`.${id}`).classList.add("filter");
      }
    }
  };
  let clear = (e) => {
    e.preventDefault();
    setFilteredClass({ name: "" });
    setSort({ name: "DEBTORS" });
    setDebtors([]);
    setOthers([]);
    setOverAllTotal(0);
    document
      .querySelectorAll(".filter")
      .forEach((elem) => elem.classList.remove("filter"));
  };
  let reset = () => {
    setViewName("");
    setViewClass({ name: "" });
    setViewPaymentId();
    setViewTotal("");
    setViewBalance("");
    viewdate.current = [];
    setViewRemark([]);
    setamountsPaid([]);
    setTotalPaid("");
    setDOG([]);
    setAccountant("");
  };
  let handlePrint = () => {
    window.print();
  };
  let viewRecord = (key) => {
    reset();
    if (
      key &&
      key !== "" &&
      key !== null &&
      key !== "undefined" &&
      key !== undefined
    ) {
      let uniqid = "mese";
      notifications.loading("Loading...", uniqid);
      fetch(`${url}/main/records/get-view?key=${key}`, {
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
            let remarks = [];
            let amountPaidArr = [];
            let dateArr = [];
            let totalPaid1 = 0;
            let DOGArr = [];
            let accountantArr = [];
            // console.log(data.message);
            setViewName(data.message[0].name);
            setViewClass({ name: data.message[0].class.toUpperCase() });
            setViewPaymentId(data.message[0].payment_id);
            setViewTotal(data.message[0].expected_payment);
            setViewBalance(data.message[0].balance);
            setAdmNo(data.adm);
            if (data.message.length > 1) {
              data.message.forEach((details) => {
                dateArr.push(details.DOP);
                accountantArr.push(details.accountant);
                remarks.push(details.remark);
                amountPaidArr.push(details.amount_paid);
                totalPaid1 += parseInt(details.amount_paid);
                DOGArr.push(details.created_at);
              });
              setAccountant(accountantArr);
              setViewRemark(remarks);
              setamountsPaid(amountPaidArr);
              setTotalPaid(totalPaid1);
              viewdate.current = dateArr;
              setDOG(DOGArr);
            } else {
              setViewRemark([data.message[0].remark]);
              viewdate.current = [data.message[0].DOP];
              setamountsPaid([data.message[0].amount_paid]);
              setTotalPaid(data.message[0].amount_paid);
              setDOG([data.message[0].created_at]);
              setAccountant([data.message[0]?.accountant]);
            }
            document
              .getElementsByClassName("print-modal")[0]
              .classList.add("show-modal");
            document.body.style.overflow = "hidden";
            window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
          } else {
            notifications.warning(data.message, uniqid);
          }
        })
        .catch((err) => {
          toast.dismiss(uniqid);
          notifications.warning("Error: Failed to fetch");
          console.log(err);
        });
    }
  };
  return (
    <div className="__debtors">
      <Button
        text
        size="small"
        icon="pi pi-fw pi-arrow-left"
        className="p-button-rounded"
        onClick={() => navigate(-1)}
      ></Button>
      <h2>Debtors</h2>
      <form className="search-container container">
        <Dropdown
          value={filteredClass}
          onChange={(e) => setFilteredClass(e.value)}
          options={classes}
          placeholder="Select a class"
          id="class"
          className="filter-class"
          optionLabel="name"
          onBlur={(e) => onBlur(e, "filter-class")}
        />
        <Dropdown
          value={filteredTerm}
          onChange={(e) => setFilteredTerm(e.value)}
          options={terms}
          placeholder="Select Term"
          id="term"
          className="filter-term"
          optionLabel="name"
          onBlur={(e) => onBlur(e, "term")}
        />
        <Dropdown
          value={filteredSess}
          onChange={(e) => setFilteredSess(e.value)}
          options={sessions}
          placeholder="Select session"
          id="session"
          className="filter-sess"
          optionLabel="name"
          onBlur={(e) => onBlur(e, "filter-sess")}
        />
        <Dropdown
          value={sort}
          onChange={(e) => setSort(e.value)}
          options={paymentForArr}
          placeholder="Others"
          id="sort"
          className="filter-sort"
          optionLabel="name"
          onBlur={(e) => onBlur(e, "filter-sort")}
        />

        <div className="btn-cont">
          <Button
            onClick={(e) => findRecord(e)}
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
        </div>
        <div className="btn-cont"></div>
      </form>
      <div className="d-flex justify-content-end w-100">
        {admin && (
          <Button
            size="small"
            onClick={() => navigate("../dashboard/expand-debt")}
            icon="pi pi-calendar"
            type="button"
            style={{ transform: "scale(0.8)" }}
            tooltip="Expand Debts"
            tooltipOptions={{
              position: "top",
              event: "hover",
            }}
            label="Expand Debts"
          ></Button>
        )}
      </div>
      <div className="debtors-table">
        {debtors.length !== 0 && (
          <>
            <div className="container d-flex w-100">
              <ReactHTMLTableToExcel
                id="xls-button"
                className="xls-button btn btn-dark btn-sm"
                table="table-to-xls"
                filename={
                  filteredClass.name.replace(/ /g, "_") +
                  "_" +
                  new Date(Date.now()).toLocaleTimeString().replace(/ /g, "_")
                }
                sheet="tablexls"
                buttonText="Download XLS"
              />
            </div>
            <table
              className="table table-responsive table-bordered"
              id="table-to-xls"
            >
              <thead className="thead-dark">
                <tr>
                  <th>S/N</th>
                  <th>Name</th>
                  <th>Id</th>
                  <th>Class</th>
                  <th>Total paid</th>
                  <th>Balance</th>
                  <th>Total Fee</th>
                  <th>DOP</th>
                  <th>DOB</th>
                  <th>Discount</th>
                  <th>Tel</th>
                </tr>
              </thead>
              <tbody>
                {isLoading ? (
                  <tr className="loading">
                    <td colSpan={8}>loading...</td>
                  </tr>
                ) : debtors.length === 0 ? (
                  <tr className="loading">
                    <td colSpan={8} style={{ textAlign: "center" }}>
                      No records available yet!
                    </td>
                  </tr>
                ) : (
                  debtors.map((record, index) => (
                    <tr
                      key={record.keyid + new Date() + Math.random()}
                      title={record?.remark}
                      className={
                        !record?.expected_payment || record?.balance !== "0"
                          ? "alert alert-danger"
                          : ""
                      }
                    >
                      <td>{index + 1}</td>
                      <td
                        onClick={() => viewRecord(record?.keyid)}
                        style={{ cursor: "pointer" }}
                      >
                        {record?.name?.toUpperCase()}{" "}
                        <small>
                          {record?.expected_payment && (
                            <b>({others[index]?.total})</b>
                          )}
                        </small>{" "}
                      </td>
                      <td>{record?.payment_id} </td>
                      <td>{record?.class?.toUpperCase()} </td>
                      <td>
                        {record.expected_payment &&
                          (
                            record?.expected_payment - record?.balance
                          ).toLocaleString()}{" "}
                      </td>
                      <td>{record?.balance?.toLocaleString() ?? ""} </td>
                      <td>
                        {record?.expected_payment?.toLocaleString() ?? ""}{" "}
                      </td>
                      <td>{record.DOP && formatDate(record?.DOP)} </td>
                      <td>
                        {Number(record?.balance) > 0 && (
                          <>
                            <span>
                              {record?.balance_date
                                ? formatDate(record?.balance_date) || "No Date"
                                : ""}
                            </span>{" "}
                            <span>
                              {new Date(record?.balance_date) <
                                new Date(Date.now()) && "(Expired)"}
                            </span>
                          </>
                        )}{" "}
                      </td>
                      <td>{record.discounts}</td>
                      <td>{record.phone_number}</td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
            {!isLoading ? (
              <p>Total: {Number(overAllTotal).toLocaleString()}</p>
            ) : (
              ""
            )}
          </>
        )}
      </div>
      <ModalCont
        title={""}
        classModal="print-modal"
        btn="Print"
        save={handlePrint}
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
            <h4 className="h5">Student Info</h4>
            <div className="table-responsive">
              <table className="table table-bordered">
                <thead>
                  <tr>
                    <th>Name</th>
                    <td>{viewName?.toUpperCase()}</td>
                    <th>Class</th>
                    <td>{viewClass.name?.toUpperCase()}</td>
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
                      <td>{admNo !== "" ? admNo?.toUpperCase() : ""}</td>
                    </tr>
                  </thead>
                ) : (
                  ""
                )}
              </table>
            </div>
          </div>
          <div className="fee-info">
            <h4 className="h5">Fee Info</h4>
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
                        title={accountant[index]}
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
              {" "}
              <div>Cashier: </div>
              {accountant[0]}
            </div>
          </div>
        </div>
      </ModalCont>
    </div>
  );
};

export default Debtors;
