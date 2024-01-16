/* eslint-disable no-dupe-keys */
import { useContext, useEffect, useState } from "react";
import { MainContext } from "../Helpers/Context";
import "../debtors/debtors.css";
import ReactHTMLTableToExcel from "react-html-table-to-excel";
import { Dropdown } from "primereact/dropdown";
import { Button } from "primereact/button";
import { Ripple } from "primereact/ripple";
import { Calendar } from "primereact/calendar";
import { useNavigate } from "react-router-dom";
const Statement = () => {
  const [filteredClass, setFilteredClass] = useState({ name: "" });
  const [from, setFrom] = useState("");
  const [to, setTo] = useState("");
  const [classes, setClasses] = useState([]);
  const [debtors, setDebtors] = useState([]);
  const [total, setTotal] = useState(0);
  const [isLoading, setIsLoading] = useState(false);
  let { url, notifications } = useContext(MainContext);
  const navigate = useNavigate();

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
            let setClass = async () => {
              testClass = await testClass.map((classe) => {
                return { name: classe.toUpperCase() };
              });
              return { testClass };
            };
            // setClasses(setClass().then((data) => data));
            setClass().then(({ testClass }) => {
              setClasses(testClass);
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
      setClasses([]);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [document.readyState]);
  let findRecord = (e) => {
    e.preventDefault();
    if (from === "" || from === null) {
      notifications.warning("Enter the necessaey fields", "fapsjps");
      return;
    } else {
      setIsLoading(true);
      if (to === "" || to === null) to === "";
      else to === to;
      fetch(`${url}/main/records/statement`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
        body: JSON.stringify({
          from: from,
          to: to != null ? new Date(to) : "",
          filteredClass:
            filteredClass.name.toLowerCase() !== ""
              ? filteredClass.name.toLowerCase()
              : "",
        }),
      })
        .then((res) => res.json())
        .then((data) => {
          setIsLoading(false);
          if (data.status) {
            setDebtors(data.message);
            if (
              data.message?.length !== "undefined" &&
              data.message?.length > 0
            ) {
              let allAmount = [];
              allAmount = data.message.map((item) => item?.amount_paid || 0);
              setTotal(() =>
                allAmount.reduce(
                  (accumulator, currentValue) =>
                    Number(accumulator) + Number(currentValue),
                  0
                )
              );
            }
          } else {
            notifications.warning(data.message);
          }
        })
        .catch((err) => {
          setIsLoading(false);
          console.log(err);
        });
    }
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
  let clear = (e) => {
    e.preventDefault();
    setFilteredClass({ name: "" });
    setDebtors([]);
    setFrom("");
    setTo("");
  };

  return (
    <div className="__statements">
      <Button
        text
        size="small"
        icon="pi pi-fw pi-arrow-left"
        className="p-button-rounded"
        onClick={() => navigate(-1)}
      ></Button>
      <h2>Statement</h2>
      <form className="search-container container">
        <Calendar
          value={from}
          onChange={(e) => setFrom(e?.value)}
          dateFormat="dd/mm/yy"
          showButtonBar
          id="from"
          placeholder="Start date"
          showIcon
        />
        <Calendar
          value={to}
          onChange={(e) => setTo(e?.value)}
          dateFormat="dd/mm/yy"
          id="to"
          showButtonBar
          placeholder="End date"
          showIcon
        />
        <Dropdown
          value={filteredClass}
          onChange={(e) => setFilteredClass(e.value)}
          options={classes}
          placeholder="Select a class"
          id="class"
          className="filter-class"
          optionLabel="name"
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
      <div className="debtors-table">
        {debtors.length !== 0 && (
          <>
            <div className="container d-flex w-100 justify-content-end">
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
                  <th>Amount</th>
                  <th>Date of Payment</th>
                  <th>Date Of Generation</th>
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
                      No payment available yet!
                    </td>
                  </tr>
                ) : (
                  debtors.map((record, index) => (
                    <tr
                      key={record.keyid + new Date() + Math.random()}
                      title={record?.remark}
                    >
                      <td>{index + 1}</td>
                      <td>{record?.name?.toUpperCase()} </td>
                      <td>{record?.payment_id} </td>
                      <td>{record?.class?.toUpperCase()} </td>
                      <td>{record.amount_paid}</td>
                      <td>
                        <span>{formatDate(record?.DOP)}</span>
                      </td>
                      <td>{formatDate(record?.created_at)} </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
            {!isLoading ? <p>Total: {Number(total).toLocaleString()}</p> : ""}
          </>
        )}
      </div>
    </div>
  );
};

export default Statement;
