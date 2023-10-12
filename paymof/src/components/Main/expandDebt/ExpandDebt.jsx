/* eslint-disable no-dupe-keys */
import { useContext, useEffect, useState } from "react";
import { MainContext } from "../Helpers/Context";
import ReactHTMLTableToExcel from "react-html-table-to-excel";
import { Dropdown } from "primereact/dropdown";
import { Button } from "primereact/button";
import { Ripple } from "primereact/ripple";
import "./expandDebt.css";
import { useNavigate } from "react-router-dom";
const ExpandDebt = () => {
  const [terms, setTerms] = useState([]);
  const [sessions, setSessions] = useState([]);
  const [filteredSess, setFilteredSess] = useState({ name: "" });
  const [filteredTerm, setFilteredTerm] = useState({ name: "" });
  const [debtors, setDebtors] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [fees, setFees] = useState([]);
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
          try {
            let testTerm = data?.message[0]?.terms?.split(",");
            let testSession = data?.message[0]?.sessions?.split(",");
            let setClass = async () => {
              testTerm = await testTerm.map((term) => {
                return { name: term.toUpperCase() };
              });
              testSession = await testSession.map((session) => {
                return { name: session.toUpperCase() };
              });
              return { testTerm, testSession };
            };
            // setClasses(setClass().then((data) => data));
            setClass().then(({ testTerm, testSession }) => {
              setTerms(testTerm);
              setSessions(testSession);
            });
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
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [document.readyState]);

  let findRecord = (e) => {
    e.preventDefault();
    if (filteredTerm.name === "" || filteredSess.name === "") {
      notifications.warning("Enter the necessaey fields", "this");
      return;
    } else {
      setIsLoading(true);
      fetch(`${url}/main/dashboard/expand-debt`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
        body: JSON.stringify({
          sess: filteredSess.name,
          term: filteredTerm.name.toLowerCase(),
        }),
      })
        .then((res) => res.json())
        .then((data) => {
          setIsLoading(false);
          if (data.status) {
            setDebtors(data.debts);
            setFees(new Map(data.fees));
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
    setDebtors([]);
    document
      .querySelectorAll(".filter")
      .forEach((elem) => elem.classList.remove("filter"));
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
      <h2>Debts</h2>
      <form className="search-container container">
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
        <Button
          size="small"
          onClick={() => navigate("../debtors")}
          icon="pi pi-calendar"
          type="button"
          style={{ transform: "scale(0.8)" }}
          tooltip="Sort Debtors"
          tooltipOptions={{
            position: "top",
            event: "hover",
          }}
        ></Button>
      </div>
      <h6 className="h6" style={{ textTransform: "capitalize" }}>
        Fee amount for {filteredTerm.name?.toLowerCase()}{" "}
        {filteredSess.name?.toLowerCase()}
      </h6>
      <table className="table table-bordered">
        <thead>
          <tr>
            <th>Class</th>
            <th>Amount</th>
          </tr>
        </thead>
        <tbody>
          {Array.from(fees).map((item, index) => {
            return (
              <tr key={index + item}>
                <td>{item[0]}</td>
                <td className="td-input">
                  {" "}
                  {Number(item[1] || 0)?.toLocaleString()}{" "}
                </td>
              </tr>
            );
          })}
        </tbody>
      </table>
      <div className="debtors-table">
        {debtors.length !== 0 && (
          <>
            <h6 className="h6" style={{ textTransform: "capitalize" }}>
              Debt for {filteredTerm.name?.toLowerCase()}{" "}
              {filteredSess.name?.toLowerCase()}
            </h6>
            <table
              className="table table-responsive table-bordered"
              id="table-to-xls"
            >
              <thead className="thead-dark">
                <tr>
                  <th>Class</th>
                  <th>Debt</th>
                </tr>
              </thead>
              <tbody>
                {isLoading ? (
                  <tr className="loading">
                    <td colSpan={3}>loading...</td>
                  </tr>
                ) : debtors.length === 0 ? (
                  <tr className="loading">
                    <td colSpan={3} style={{ textAlign: "center" }}>
                      No debtors available yet!
                    </td>
                  </tr>
                ) : (
                  debtors.map((record) => (
                    <tr key={new Date() + Math.random()}>
                      <td>{record?.class}</td>
                      <td>{Number(record?.debt || 0)?.toLocaleString()} </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
            <div className="container">
              <ReactHTMLTableToExcel
                id="xls-button"
                className="xls-button btn btn-dark btn-sm"
                table="table-to-xls"
                filename={
                  filteredSess.name.replace(/ /g, "_") +
                  filteredTerm.name.replace(/ /g, "_") +
                  "_" +
                  new Date(Date.now()).toLocaleTimeString().replace(/ /g, "_")
                }
                sheet="tablexls"
                buttonText="Download XLS"
              />
            </div>
          </>
        )}
      </div>
    </div>
  );
};

export default ExpandDebt;
