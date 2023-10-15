import { useContext, useEffect, useState, useId } from "react";
import "./records.css";
import { MainContext } from "../Helpers/Context";
import ModalCont from "../../small_comps/modal/ModalCont";
import { useNavigate } from "react-router-dom";
import { RiEdit2Line } from "react-icons/ri";
import { useRef } from "react";
import toast, { Toaster } from "react-hot-toast";
import { Calendar } from "primereact/calendar";
import { InputNumber } from "primereact/inputnumber";
import { Dropdown } from "primereact/dropdown";
import { AutoComplete } from "primereact/autocomplete";
import { Button } from "primereact/button";
import { Ripple } from "primereact/ripple";
import { Paginator } from "primereact/paginator";
import { InputText } from "primereact/inputtext";

const Records = () => {
  const navigate = useNavigate();
  const [name, setName] = useState("");
  const [filteredClass, setFilteredClass] = useState({ name: "" });
  const [filteredSess, setFilteredSess] = useState({ name: "" });
  const [filteredTerm, setFilteredTerm] = useState({ name: "" });
  const [classes, setClasses] = useState([]);
  const [sessions, setSessions] = useState([]);
  const [autoname, setAutoName] = useState([]);
  const [terms, setTerms] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [searchId, setSearchId] = useState(0);
  const filterArray = [];
  const [records, setRecords] = useState([]);
  const [totalPages, setTotalPages] = useState(0);
  const [currentPage, setcurrentPage] = useState(1);
  const [viewName, setViewName] = useState("");
  const [viewClass, setViewClass] = useState({ name: "" });
  const [viewPaymentId, setViewPaymentId] = useState("");
  const [viewTotal, setViewTotal] = useState("");
  const [viewBalance, setViewBalance] = useState("");
  // eslint-disable-next-line no-unused-vars
  const [_, setDOG] = useState([]);
  const [viewRemark, setViewRemark] = useState([]);
  const [amountsPaid, setamountsPaid] = useState([]);
  const [totalPaid, setTotalPaid] = useState(0);
  const [viewDOB, setViewDOB] = useState("");
  const [limit, setLimit] = useState(6);
  const [path, setPath] = useState("records");
  const [first, setFirst] = useState(0);
  const [rows, setRows] = useState(1);
  const [accountant, setAccountant] = useState([]);
  const [admNo, setAdmNo] = useState("");
  const [totalRecords, setTotalRecords] = useState(0);
  let viewdate = useRef([]);
  let editKey = useRef("");
  let uniqueId = useId();
  let { url, notifications, logo } = useContext(MainContext);
  let fetchFilters = () => {
    fetch(`${url}/main/payment/classes`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
    })
      .then((res) => res?.json())
      .then((data) => {
        if (data?.status) {
          let newCls;
          newCls = data?.message[0];
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
              setTerms(testTerm);
              setSessions(testSession);
            });
          } catch {
            console.log("failed to set datas");
          }
        }
      })

      .catch((err) => console.log(err));
  };
  let fetchRecord = () => {
    setIsLoading(true);
    let status = false;
    if (searchId > 0) status = true;
    else status = false;
    let datas = {
      searchId,
      name: name?.trim()?.toLowerCase(),
      status,
      limit,
      page: currentPage,
    };
    // let uniqid = uniqueId;
    // notifications.loading("Loading...", uniqid);
    fetch(`${url}/main/records/${path}`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
      body: JSON?.stringify(datas),
    })
      .then((res) => res?.json())
      .then((data) => {
        // toast.dismiss(uniqid);
        setIsLoading(false);
        if (data?.status) {
          try {
            setRecords(data?.message);
            setTotalRecords(data?.total);
            setTotalPages(Math?.ceil(data?.total / limit));
          } catch {
            console.log("failed to set datas");
          }
        } else {
          notifications?.warning(data?.message);
        }
      })
      .catch((err) => {
        setIsLoading(false);
        console.log(err);
        // toast.dismiss(uniqid);
        // notifications.warning("Error Fetching data", uniqueId);
      });
  };

  let changePage = (e) => {
    setFirst(e.first);
    setRows(e.rows);
    // console.log(e, currentPage, limit);
    handlePageChange(e.page + 1);
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
  useEffect(() => {
    fetchFilters();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [document.readyState]);

  useEffect(() => {
    fetchRecord();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [currentPage, path, limit]);

  let setNameFnc = (e) => {
    if (e.value.name !== undefined) {
      setName(e.value.name);
    } else {
      setName(e.value);
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
  let changeClass = (e) => {
    setViewClass(e?.value);
  };
  let handlePageChange = (newPage) => {
    setcurrentPage(newPage);
    setIsLoading(true);
    let status = false;
    if (searchId > 0) status = true;
    else status = false;
    let datas = {
      searchId,
      name: name.trim().toLowerCase(),
      status,
      limit,
      page: newPage,
    };
    fetch(`${url}/main/records/${path}/`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
      body: JSON.stringify(datas),
    })
      .then((res) => res.json())
      .then((data) => {
        setIsLoading(false);
        if (data.status) {
          try {
            setRecords(data.message);
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
  let autoCompleteName = (value) => {
    setSearchId(0);
    if (value.length > 1) {
      if (filteredClass.name !== "") {
        filterArray[0] = { class: filteredClass.name };
      }
      if (filteredSess.name !== "") {
        filterArray[1] = { session: filteredSess.name };
      }
      if (filteredTerm.name !== "") {
        filterArray[2] = { term: filteredTerm.name };
      }
      if (filterArray.length > 0) {
        fetch(`${url}/main/records/find-name`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            name: value,
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
        fetch(`${url}/main/records/find-name`, {
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
  const clickAutoName = (details) => {
    setName(details.name.toUpperCase());
    setAutoName([]);
    setSearchId(details.payment_id);
  };
  let findId = (e) => {
    e.preventDefault();
    setAutoName([]);
    setPath("findId");
    setcurrentPage(1);
    setFilteredClass({ name: "" });
    setFilteredSess({ name: "" });
    setFilteredTerm({ name: "" });
    clearFilter();
    let status = false;
    if (searchId > 0) status = true;
    else status = false;
    let datas = {
      searchId,
      name: name.trim().toLowerCase(),
      status,
      limit,
      page: 1,
    };
    if (searchId || name) {
      let uniqid = uniqueId;
      notifications.loading("Loading...", uniqid);
      fetch(`${url}/main/records/findId`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(datas),
        credentials: "include",
      })
        .then((res) => res?.json())
        .then((data) => {
          toast.dismiss(uniqid);
          if (data?.status) {
            setRecords(() => data?.message);
            setTotalPages(Math?.ceil(data?.total / limit));
          }
        })

        .catch((err) => {
          toast.dismiss(uniqid);
          console.log(err);
        });
    } else {
      notifications.warning("Empty search", uniqueId);
    }
  };
  let setFilteredClassFnc = (e) => {
    setFilteredClass(e.value);
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
  let setFilteredTermFnc = (e) => {
    setFilteredTerm(e.value);
  };
  let setFilteredSessFnc = (e) => {
    setFilteredSess(e.value);
  };
  let clearFilter = () => {
    document.querySelector(".filter-class").classList.remove("filter");
    document.querySelector(".filter-term").classList.remove("filter");
    document.querySelector(".filter-sess").classList.remove("filter");
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
    setViewDOB("");
    setAccountant("");
  };
  let viewRecord = (key) => {
    reset();
    if (key) {
      let uniqid = uniqueId;
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
            setViewDOB(data.message[0].balance_date);
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
  let clear = (e) => {
    e.preventDefault();
    setName("");
    setAutoName([]);
    setFilteredClass({ name: "" });
    setFilteredSess({ name: "" });
    setFilteredTerm({ name: "" });
    setPath("records");
    setcurrentPage(1);
    fetchRecord();
    clearFilter();
  };
  let deleteRecord = (key) => {
    if (key) {
      notifications.confirmDelete(
        "Are you sure you wan to delete this record?",
        () => {
          let uniqid = uniqueId;
          notifications.loading("Deleting...", uniqid);
          fetch(`${url}/main/records/delete?key=${key}`, {
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
                setRecords(records.filter((data) => data.keyid !== key));
              } else {
                notifications.warning(data.message, uniqueId);
              }
            })
            .catch((err) => {
              toast.dismiss(uniqid);
              notifications.warning("Error: Failed to delete");
              console.log(err);
            });
        },
        () => {},
        [key]
      );
    }
  };
  let editRecord = (key) => {
    reset();
    if (key) {
      let uniqid = uniqueId;
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
            setViewName(data.message[0].name);
            setViewClass({ name: data.message[0].class.toUpperCase() });
            setViewPaymentId(data.message[0].payment_id);
            setViewTotal(data.message[0].expected_payment);
            setViewBalance(data.message[0].balance);
            setViewDOB(new Date(data.message[0].balance_date));

            editKey.current = data.message[0].keyid;
            if (data.message.length > 1) {
              data.message.forEach((details) => {
                dateArr.push(details.DOP);
                remarks.push(details.remark);
                amountPaidArr.push(details.amount_paid);
                totalPaid1 += parseInt(details.amount_paid);
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
            }

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
          toast.dismiss(uniqid);
          notifications.warning("Error: Failed to fetch record");
          console.log(err);
        });
    }
  };
  let saveEdit = () => {
    let status = viewDOB === "" ? false : true;
    if (
      editKey.current === "" ||
      viewName === "" ||
      viewClass.name === "" ||
      viewTotal === "" ||
      viewBalance === ""
    ) {
      notifications.warning("Try refreshing this page.", uniqueId);
    } else {
      let uniqid = uniqueId;
      notifications.loading("Saving...", uniqid);
      fetch(`${url}/main/records/edit`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
        body: JSON.stringify({
          key: editKey.current,
          name: viewName,
          studentClass: viewClass.name,
          balanceDate: viewDOB,
          total: viewTotal,
          balance: viewBalance,
          status,
        }),
      })
        .then((res) => res.json())
        .then((data) => {
          toast.dismiss(uniqid);
          if (data.status) {
            toast.success(data.message);
            document
              .getElementsByClassName("edit-modal")[0]
              .classList.remove("show-modal");
            document.body.style.overflow = "auto";
            document.body.style.top = "";
            fetchRecord();
          } else {
            notifications.warning(data.message, uniqueId);
          }
        })
        .catch((err) => {
          toast.dismiss(uniqid);
          notifications.warning("Error: Failed to edit record");
          console.log(err);
        });
    }
  };
  let handlePrint = () => {
    window.print();
  };
  useEffect(() => {
    if (viewTotal && totalPaid) {
      let sub = viewTotal - totalPaid;
      setViewBalance(sub);
    }
  }, [viewTotal, totalPaid]);
  let setLimitFnc = (e) => {
    setLimit(e?.target?.value);
    setcurrentPage(1);
  };
  let setViewDOBFnc = (e) => {
    if (new Date(e.value) < new Date(Date.now())) {
      notifications.warning(
        "Balance Date is should be in the future",
        uniqueId
      );
      return;
    } else {
      setViewDOB(e.value);
    }
  };
  let formatTimeAgo = (date) => {
    let formatter = new Intl.RelativeTimeFormat(undefined, {
      numeric: "auto",
    });
    const DIVISION = [
      { amount: 60, name: "seconds" },
      { amount: 60, name: "minutes" },
      { amount: 24, name: "hours" },
      { amount: 7, name: "days" },
      { amount: 4.34524, name: "weeks" },
      { amount: 12, name: "months" },
      { amount: Number.POSITIVE_INFINITY, name: "years" },
    ];

    let duration = (date - new Date()) / 1000;
    for (let i = 0; i < DIVISION.length; i++) {
      const division = DIVISION[i];
      if (Math.abs(duration) < division.amount) {
        return formatter.format(Math.round(duration), division.name);
      }
      duration /= division.amount;
    }
  };
  return (
    <div className="__records">
      <div>
        <Toaster position="top-center" reverseOrder={false} />
      </div>

      <h2>Records</h2>
      <form className="search-container">
        <label htmlFor="name">Name</label>
        <div className="input-filter-cont">
          <AutoComplete
            value={name}
            suggestions={autoname}
            completeMethod={(e) => autoCompleteName(e.query)}
            onChange={(e) => setNameFnc(e)}
            field="name"
            itemTemplate={autoCompleteTemplate}
            id="name"
            placeholder="Enter name to search"
            autoFocus={true}
            onSelect={(e) => clickAutoName(e.value)}
          />
        </div>
        <Dropdown
          value={filteredClass}
          onChange={(e) => setFilteredClassFnc(e)}
          options={classes}
          placeholder="Select a class"
          id="class"
          className="filter-class"
          optionLabel="name"
          onBlur={(e) => onBlur(e, "filter-class")}
        />
        <Dropdown
          value={filteredTerm}
          onChange={(e) => setFilteredTermFnc(e)}
          options={terms}
          placeholder="Select Term"
          id="term"
          className="filter-term"
          optionLabel="name"
          onBlur={(e) => onBlur(e, "term")}
        />
        <Dropdown
          value={filteredSess}
          onChange={(e) => setFilteredSessFnc(e)}
          options={sessions}
          placeholder="Select session"
          id="session"
          className="filter-sess"
          optionLabel="name"
          onBlur={(e) => onBlur(e, "filter-sess")}
        />
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
        </div>
      </form>
      <div className="view-debtor-cont">
        <div
          className="refresh"
          style={{
            display: "flex",
            justifyContent: "flex-end",
            margin: ".2rem 0",
            padding: ".5rem",
          }}
        >
          <i
            title="refresh"
            onClick={() => fetchRecord()}
            className="pi pi-refresh refresh-tooltip"
            style={{ cursor: "pointer", marginRight: "1rem" }}
          ></i>
          <small>Total: {totalRecords}</small>
        </div>
        <Button
          size="small"
          onClick={() => navigate("../debtors")}
          icon="pi pi-calendar"
          type="button"
          style={{ transform: "scale(0.8)" }}
          tooltip="Sort Debtors"
          tooltipOptions={{
            position: "bottom",
            event: "hover",
          }}
        ></Button>
        <Button
          size="small"
          onClick={() => navigate("../weekly-report")}
          // label="Weekly report"
          severity="help"
          icon="pi pi-calculator"
          style={{ transform: "scale(0.8)" }}
          tooltip="Weekly Report"
          tooltipOptions={{
            position: "bottom",
            event: "hover",
          }}
        ></Button>
        <Button
          severity="warning"
          size="small"
          onClick={() => navigate("../statement")}
          icon="pi pi-book"
          title="Statement"
          style={{ transform: "scale(0.8)" }}
          tooltip="View Statement"
          tooltipOptions={{
            position: "bottom",
            event: "hover",
          }}
        ></Button>
      </div>
      <div className="balance-table">
        <div className="table-cont table-responsive">
          <div className="our-table">
            <div className="header">
              Name
              <Dropdown
                value={limit}
                options={[6, 10, 20, 50, 70, 100, 200, 500, 1000]}
                onChange={(e) => setLimitFnc(e)}
              />
            </div>
            <div className="header">payment id</div>
            <div className="header">Class</div>
            <div className="header">Total </div>
            <div className="header">Balance</div>
            <hr />
            {isLoading ? (
              <div
                className="table-row loading"
                style={{ textAlign: "center", padding: ".3rem" }}
              >
                loading...
              </div>
            ) : records?.length === 0 ? (
              <div
                className="table-row"
                style={{ textAlign: "center", padding: ".3rem" }}
              >
                No records available
              </div>
            ) : (
              records?.map((record) => (
                <details
                  className="table-row"
                  key={record?.keyid + new Date() + Math.random()}
                >
                  <summary>
                    <span>{record?.name}</span>
                    <span>{record?.payment_id}</span>
                    <span>{record?.class}</span>
                    <span>
                      {parseInt(record?.expected_payment)?.toLocaleString()}
                    </span>
                    <span>{parseInt(record?.balance)?.toLocaleString()}</span>
                  </summary>
                  <p className="alert alert-info">
                    <small className="alert-heading h5">Details</small>
                    <span className="details-content">
                      <span>Name</span>
                      <span>{record?.name}</span>
                    </span>

                    <span className="details-content">
                      <span>Amount Paid</span>
                      <span>
                        &#x20A6;
                        {parseInt(record?.amount_paid)?.toLocaleString()}
                      </span>
                    </span>
                    <span className="details-content">
                      <span>Balance</span>
                      <span>
                        &#x20A6;{parseInt(record?.balance)?.toLocaleString()}
                      </span>
                    </span>
                    <span className="details-content">
                      <span>Total</span>
                      <span>
                        &#x20A6;
                        {parseInt(record?.expected_payment)?.toLocaleString()}
                      </span>
                    </span>
                    <span className="details-content">
                      <span>Date of Payment</span>
                      <span>{formatDate(record?.DOP)}</span>
                    </span>
                    <span className="details-content">
                      <span>Remark</span>
                      <span>{record?.remark}</span>
                    </span>
                    <span className="details-content">
                      <span>Payment Method</span>
                      <span>{record?.payment_method}</span>
                    </span>
                    <span className="details-content">
                      <span>Payment For</span>
                      <span>{record?.payment_for}</span>
                    </span>
                    {Number(record.balance) > 0 && (
                      <span className="details-content">
                        <span>Balance Date</span>
                        <span>
                          {formatDate(record?.balance_date)}

                          <b>
                            &nbsp;(expire
                            {(record?.balance_date &&
                              formatTimeAgo(
                                new Date(record?.balance_date)
                              )?.includes("ago")) ||
                            formatTimeAgo(
                              new Date(record?.balance_date)
                            )?.includes("yesterday")
                              ? "d"
                              : "s"}{" "}
                            {formatTimeAgo(new Date(record?.balance_date))})
                          </b>
                        </span>
                      </span>
                    )}
                    <span className="details-content">
                      <span>Date of Generation</span>
                      <span>{formatDate(record?.created_at)}</span>
                    </span>
                    <span className="details-content">
                      <span>Cashier</span>
                      <span>{record?.accountant}</span>
                    </span>
                    <span className="details-content">
                      <button
                        onClick={() => viewRecord(record?.keyid)}
                        className="btn btn-secondary btn-sm mt-2"
                      >
                        View
                      </button>
                      <button
                        onClick={() => deleteRecord(record?.keyid)}
                        className="btn btn-danger btn-sm mt-2"
                      >
                        Delete
                      </button>
                      <button
                        onClick={() => editRecord(record?.keyid)}
                        className="btn btn-light btn-sm mt-2"
                      >
                        <RiEdit2Line fill="orangered" /> Edit
                      </button>
                    </span>
                  </p>
                </details>
              ))
            )}
          </div>
        </div>
        {records?.length > 0 && (
          <div className="pagination-buttons">
            <Paginator
              first={first}
              rows={rows}
              totalRecords={totalPages}
              onPageChange={(e) => changePage(e)}
            />
          </div>
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

      <ModalCont title="Edit Record" classModal="edit-modal" save={saveEdit}>
        <form action="">
          <div className="input-cont">
            <label htmlFor="balance-user">Name</label>
            <InputText
              type="text"
              value={viewName.toUpperCase()}
              id="balance-user"
              onChange={(e) => setViewName(e.target.value)}
            />
          </div>
          <div className="input-cont">
            <label htmlFor="class">Class</label>
            <Dropdown
              value={viewClass}
              onChange={(e) => changeClass(e)}
              options={classes}
              placeholder="Select a class"
              id="class"
              optionLabel="name"
            ></Dropdown>
          </div>
          <div className="input-cont">
            <label htmlFor="total">Total</label>
            <InputNumber value={viewTotal} disabled id="total" />
          </div>
          <div className="input-cont">
            <label htmlFor="balance-payment">Balance</label>
            <InputNumber value={viewBalance} disabled id="balance-payment" />
          </div>
          {viewBalance > 0 && (
            <div className="input-cont">
              <label htmlFor="DOB">Date of Balance</label>
              <Calendar
                value={viewDOB}
                id="DOB"
                onChange={(e) => setViewDOBFnc(e)}
                showIcon
              />
            </div>
          )}
        </form>
      </ModalCont>
    </div>
  );
};

export default Records;
