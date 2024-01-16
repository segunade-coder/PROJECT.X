import { useContext, useEffect, useState, useId } from "react";
import "./fees.css";
import ModalCont from "../../small_comps/modal/ModalCont";
import { MainContext } from "../Helpers/Context";
import { useRef } from "react";
import toast, { Toaster } from "react-hot-toast";
import { Calendar } from "primereact/calendar";
import { AutoComplete } from "primereact/autocomplete";
import { Dropdown } from "primereact/dropdown";
import { Button } from "primereact/button";
import { Ripple } from "primereact/ripple";
import { Paginator } from "primereact/paginator";
import { useSearchParams } from "react-router-dom";

const Fees = () => {
  let date = new Date();
  let uniqueId = useId();
  let dateArr = [
    date.getDate() < 10 ? `0${date.getDate()}` : date.getDate(),
    date.getUTCMonth() + 1 < 10
      ? `0${date.getUTCMonth() + 1}`
      : date.getUTCMonth() + 1,
    date.getUTCFullYear(),
  ];
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
  const [paymentForArr, setPaymentForArr] = useState([]);
  const [paymentFor, setPaymentFor] = useState({ name: "" });
  const [paymentMethod, setPaymentMethod] = useState({ name: "" });
  const [paymentMethodArr, setPaymentMethodArr] = useState([]);
  const [balanceUser, setBalanceUser] = useState("");
  const [paymentId, setPaymentId] = useState("");
  const [total, setTotal] = useState(0);
  const [remark, setRemark] = useState("");
  const [term, setTerm] = useState("");
  const [session, setSession] = useState("");
  const [DOG] = useState(dateArr.join("/"));
  const [DOP, setDOP] = useState("");
  const [balanceDate, setBalanceDate] = useState("");
  const [advance, setAdvance] = useState(0);
  const [keyId, setkeyId] = useState("");
  const [balancePayment, setBalancePayment] = useState("");
  const [balanceClass, setBalanceClass] = useState("");
  const [showDOB, setShowDOB] = useState(false);
  const filterArray = [];
  const [records, setRecords] = useState([]);
  const [ErrArr, setErrArr] = useState([]);
  const [totalPages, setTotalPages] = useState(0);
  const [currentPage, setcurrentPage] = useState(1);
  const [wallets, setWallets] = useState([]);
  const [defaultWallet, setDefaultWallet] = useState("");
  const limit = 6;
  const [first, setFirst] = useState(0);
  const [rows, setRows] = useState(1);
  const [totalFee, setTotalFee] = useState(0);
  let [searchParams] = useSearchParams();
  const [url_fees, setUrl_fees] = useState(searchParams.get("id"));

  let autoCom = useRef();
  let { url, loggedUser, notifications, io } = useContext(MainContext);
  useEffect(() => {
    if (url_fees !== "" && url_fees !== null) {
      notifications.loading("Loading.", "menasuda");
      fetch(`${url}/main/fees/ind-record`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ searchid: url_fees }),
        credentials: "include",
      })
        .then((res) => res.json())
        .then((data) => {
          if (data?.message?.length > 0) {
            if (data.status) {
              toast.dismiss("menasuda");
              setRecords(() => data.message);
              setUrl_fees("");
            }
          } else {
            setUrl_fees("");
            notifications.success("Student has cleared.", "menasuda");
            fetchRecord();
          }
        })

        .catch((err) => {
          toast.dismiss("menasuda");
          console.log(err);
        });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [url_fees]);
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
            let testMethod = newCls.payment_method?.split(",");
            let testWallet = new Map(JSON?.parse(newCls?.wallets));
            let setClass = async () => {
              testClass = await testClass.map((classe) => {
                return { name: classe?.toUpperCase() };
              });
              testTerm = await testTerm.map((term) => {
                return { name: term?.toUpperCase() };
              });
              testSession = await testSession.map((session) => {
                return { name: session?.toUpperCase() };
              });

              testPaymentFor = await testPaymentFor.map((paymentFor) => {
                return { name: paymentFor?.toUpperCase() };
              });
              testMethod = await testMethod.map((methodFor) => {
                return { name: methodFor?.toUpperCase() };
              });
              testWallet = await [...testWallet].map((wallet) => {
                return { name: wallet[0]?.toUpperCase() };
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
                setClasses(testClass);
                setTerms(testTerm);
                setSessions(testSession);
                setPaymentForArr(testPaymentFor);
                setPaymentMethodArr(testMethod);
                setWallets(testWallet);
              }
            );
            setSession({
              name: data?.message[0]?.current_session?.toUpperCase(),
            });
            setTerm({ name: data?.message[0]?.current_term.toUpperCase() });
            setDefaultWallet({
              name: newCls?.default_wallets?.toUpperCase(),
            });
          } catch {
            console.log("failed to set datas");
          }
        }
      })

      .catch((err) => console.log(err));
  };

  let fetchRecord = () => {
    if (url_fees === "" || url_fees === null) {
      setIsLoading(true);
      fetch(`${url}/main/fees/records?page=${currentPage}&limit=${limit}`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
      })
        .then((res) => res.json())
        .then((data) => {
          setIsLoading(false);
          if (data.status) {
            try {
              setRecords(data.message);
              setTotalFee(data.total);
              setTotalPages(Math.ceil(data.total / limit));
            } catch {
              notifications.warning("Failed to set data", uniqueId);
            }
          } else {
            notifications.warning(data.message, uniqueId);
          }
        })
        .catch((err) => {
          setIsLoading(false);
          console.log(err);
        });
    }
  };
  let changePage = (e) => {
    setFirst(e.first);
    setRows(e.rows);
    // console.log(e, currentPage, limit);
    handlePageChange(e.page + 1);
  };
  useEffect(() => {
    fetchRecord();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [currentPage]);
  useEffect(() => {
    fetchFilters();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [document.readyState]);

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
        fetch(`${url}/main/fees/find-name`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            name: value.toLowerCase().trim(),
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
        fetch(`${url}/main/fees/find-name`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            name: value.toLowerCase().trim(),
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
  let handlePageChange = (newPage) => {
    setcurrentPage(newPage);
    fetch(`${url}/main/fees/records?page=${newPage}&limit=${limit}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
    })
      .then((res) => res.json())
      .then((data) => {
        setIsLoading(false);
        if (data.status) {
          try {
            setRecords(data.message);
            // console.log(data.message)
          } catch {
            notifications.warning.log("failed to set datas", uniqueId);
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
  const clickAutoName = (details) => {
    setName(details.name.toUpperCase());
    setAutoName([]);
    setSearchId(details.payment_id);
  };
  let findId = (e) => {
    e?.preventDefault();
    setAutoName([]);
    setFilteredClass({ name: "" });
    setFilteredSess({ name: "" });
    setFilteredTerm({ name: "" });
    document.querySelector(".filter-class").classList.add("filter");
    clearFilter();
    clearFilter();
    let status = false;
    if (searchId > 0) status = true;
    else status = false;
    let datas = {
      searchId,
      name: name.trim().toLowerCase(),
      status,
    };
    if (searchId || name) {
      let uniqid = uniqueId;
      notifications.loading("Loading...", uniqid);
      fetch(`${url}/main/fees/findId`, {
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
            setRecords(() => data.message);
            setTotalFee(data.total);
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
  let setFilteredTermFnc = (e) => {
    setFilteredTerm(e.value);
  };
  let setFilteredSessFnc = (e) => {
    setFilteredSess(e.value);
  };
  let setAdvanceFee = (e) => {
    setAdvance(e.value);
    if (parseInt(e.value) > parseInt(balancePayment)) {
      notifications.warning("Advance is greater than balance", uniqueId);
      setErrArr(["advance is greater than balance"]);
    } else {
      setErrArr([]);
    }
  };
  let reset = () => {
    setBalanceUser("");
    setPaymentId("");
    setTotal("");
    setBalancePayment("");
    setTerm("");
    setSession("");
    setkeyId("");
    setAdvance(0);
    setPaymentFor({ name: "" });
    setPaymentMethod({ name: "" });
    setDOP("");
    setRemark("");
    setBalanceDate("");
  };
  let balanceFeeBtn = (key) => {
    reset();
    let balanceDetails = records.find((record) => record.keyid === key);
    setBalanceUser(balanceDetails.name.toUpperCase());
    setBalanceClass(balanceDetails.class.toUpperCase());
    setPaymentId(balanceDetails.payment_id);
    setTotal(parseInt(balanceDetails.expected_payment));
    setBalancePayment(parseInt(balanceDetails.balance));
    setTerm({ name: balanceDetails.term });
    setSession(balanceDetails.session);
    setkeyId(balanceDetails.keyid);
    document.getElementsByClassName("fee-modal")[0].classList.add("show-modal");
    document.body.style.overflow = "hidden";
    window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
  };
  let saveBalance = () => {
    if (
      paymentFor.name === "" ||
      paymentMethod.name === "" ||
      advance === "" ||
      advance === 0 ||
      date === ""
    ) {
      notifications.warning("Fill in all fields", uniqueId);
    } else {
      if (remark === "") setRemark(paymentFor.name);
      if (ErrArr.length > 0) notifications.warning(ErrArr[0], uniqueId);
      else {
        notifications.loading("Saving...", uniqueId);
        fetch(`${url}/main/fees/save`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          credentials: "include",
          body: JSON.stringify({
            name: balanceUser.toLowerCase(),
            payment_id: paymentId,
            amount_paid: advance,
            expected_payment: total,
            balance: balancePayment - advance,
            term: term.name.toLowerCase(),
            session,
            DOG,
            DOP,
            balanceClass,
            balance_date: balanceDate,
            remark: remark
              ? remark.toLowerCase()
              : paymentFor.name.toLowerCase(),
            keyid: keyId,
            payment_for: paymentFor.name.toLowerCase(),
            payment_method: paymentMethod.name.toLowerCase(),
            defaultWallet: defaultWallet.name.toLowerCase(),
            accountant: loggedUser.toLowerCase(),
          }),
        })
          .then((res) => res.json())
          .then((data) => {
            if (data.status) {
              notifications.success(data.message, uniqueId);
              setcurrentPage(1);
              fetchRecord();
              io.emit("display_notification", {
                type:
                  parseInt(balancePayment) - parseInt(advance) === 0
                    ? "cleared"
                    : "part",
                name: balanceUser.toLowerCase(),
                payment_id: paymentId,
                amount_paid: advance,
              });
              document
                .getElementsByClassName("fee-modal")[0]
                .classList.remove("show-modal");
              document.body.style.overflow = "auto";
              document.body.style.top = "";
              reset();
            } else {
              notifications.warning(data.message, uniqueId);
            }
          })

          .catch((err) => {
            notifications.warning("Error: Failed to save.", uniqueId);
            console.log(err);
          });
      }
    }
  };
  let dob = () => {
    if (advance > 0) {
      if (
        ErrArr.length === 0 &&
        parseInt(balancePayment) - parseInt(advance) > 0
      ) {
        setShowDOB(true);
      }
      if (
        ErrArr.length === 0 &&
        parseInt(balancePayment) - parseInt(advance) === 0
      ) {
        setShowDOB(false);
      }
    } else {
      setShowDOB(false);
    }
  };
  let autoAdvance = () => {
    if (balancePayment) {
      setAdvance(balancePayment);
    }
  };
  let clearFilter = () => {
    document.querySelector(".filter-class").classList.remove("filter");
    document.querySelector(".filter-term").classList.remove("filter");
    document.querySelector(".filter-sess").classList.remove("filter");
  };
  let clear = (e) => {
    e.preventDefault();
    setName("");
    setAutoName([]);
    setFilteredClass({ name: "" });
    setFilteredSess({ name: "" });
    setFilteredTerm({ name: "" });
    clearFilter();
    fetchRecord();
  };
  let setDOBFnc = (e) => {
    if (new Date(e.value) < new Date(Date.now())) {
      notifications.warning(
        "Balance Date is should be in the future",
        uniqueId
      );
    } else {
      setBalanceDate(e.value);
    }
  };
  let changePaymentFor = (e) => {
    setPaymentFor(e?.value);
    setDefaultWallet({ name: "CURRENT" });
    if (e?.value?.name.includes("PART PAYMENT")) {
      setShowDOB(true);
    } else {
      setShowDOB(false);
    }

    if (e.value.name.toLowerCase().includes("bus")) {
      let wallet = wallets.find((wallet) =>
        wallet.name.toLowerCase().includes("bus")
      );
      // console.log(wallet);
      wallets !== undefined
        ? setDefaultWallet({ name: wallet.name })
        : setDefaultWallet({ name: "CURRENT" });
    }
    if (e.value.name.toLowerCase().startsWith("pta")) {
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
    let handleBlur = (e) => {
      if (autoCom.current) {
        if (!autoCom.current.contains(e.target)) {
          setAutoName([]);
        }
      }
    };
    document.addEventListener("click", handleBlur);
    return () => {
      document.removeEventListener("click", handleBlur);
    };
  }, [autoCom]);
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
        <small
          className="show-xtra"
          style={{ fontSize: "0.60rem", marginLeft: ".5rem" }}
        >
          {item.term?.toUpperCase()} {item.session?.toUpperCase()}
        </small>
      </div>
    );
  };
  return (
    <div className="__fees">
      <div>
        <Toaster position="top-center" reverseOrder={false} />
      </div>

      <h2>Balance Fee</h2>
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
      <div className="balance-table">
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
            className="pi pi-refresh"
            style={{ cursor: "pointer", marginRight: "1rem" }}
          ></i>
          <small>Total: {totalFee}</small>
        </div>
        <table border={1} className="table table-responsive table-bordered">
          <thead className="thead-dark">
            <tr>
              <th>Name</th>
              <th>payment id</th>
              <th>Class</th>
              <th>Balance (&#x20A6;)</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            {isLoading ? (
              <tr className="loading">
                <td colSpan={5} style={{ textAlign: "center" }}>
                  loading...
                </td>
              </tr>
            ) : records.length === 0 ? (
              <tr className="loading">
                <td colSpan={5} style={{ textAlign: "center" }}>
                  No records available
                </td>
              </tr>
            ) : (
              records.map((record) => (
                <tr key={record.keyid + new Date() + Math.random()}>
                  <td>{record.name}</td>
                  <td>{record.payment_id} </td>
                  <td>{record.class} </td>
                  <td>{parseInt(record.balance).toLocaleString()} </td>
                  <td>
                    <div className="action-cont">
                      <Button
                        severity="help"
                        onClick={() => balanceFeeBtn(record.keyid)}
                        label="Balance Fee"
                        link
                        className="no-shadow p-1"
                        size="small"
                        icon="pi pi-user-edit"
                      />
                    </div>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
        {records.length > 0 && (
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
      <ModalCont title="Balance Fee" classModal="fee-modal" save={saveBalance}>
        <form action="">
          <div className="input-cont">
            <label htmlFor="balance-user">Name</label>
            <input type="text" value={balanceUser} disabled id="balance-user" />
          </div>
          <div className="input-cont">
            <label htmlFor="payment-id">Payment ID</label>
            <input type="text" value={paymentId} disabled id="payment-id" />
          </div>
          <div className="input-cont">
            <label htmlFor="class">Class</label>
            <input type="text" value={balanceClass} disabled id="class" />
          </div>
          <div className="input-cont">
            <label htmlFor="total">Total</label>
            <input
              type="text"
              value={total.toLocaleString()}
              disabled
              id="total"
            />
          </div>
          <div className="input-cont">
            <label htmlFor="balance-payment">Balance</label>
            <input
              type="text"
              value={balancePayment.toLocaleString()}
              onChange={(e) => setBalancePayment(e.target.value)}
              disabled
              id="balance-payment"
            />
          </div>
          <div className="input-cont">
            <label htmlFor="date">Date</label>
            <Calendar
              value={DOP}
              onChange={(e) => setDOP(e.value)}
              id="date"
              placeholder="Date of payment"
              showIcon
              icon="pi pi-calendar"
              showButtonBar
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
            <label htmlFor="advance">Advance</label>
            <input
              type="number"
              value={advance}
              onChange={(e) => setAdvanceFee(e.target)}
              onDoubleClick={() => autoAdvance()}
              id="advance"
              placeholder="Enter Advance"
              onBlur={() => dob()}
            />
          </div>

          {showDOB && (
            <div className="input-cont">
              <label htmlFor="dob">Date of Balance</label>
              <Calendar
                value={balanceDate}
                icon="pi pi-calendar"
                onChange={(e) => setDOBFnc(e)}
                id="dob"
                placeholder="Date of Balance"
                showIcon
                showButtonBar
              />
            </div>
          )}
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
            <label htmlFor="remark">Remark</label>
            <textarea
              id="remark"
              value={remark}
              onChange={(e) => setRemark(e.target.value)}
              placeholder="Enter Remark (Optional)"
            ></textarea>
          </div>
        </form>
      </ModalCont>
    </div>
  );
};

export default Fees;
