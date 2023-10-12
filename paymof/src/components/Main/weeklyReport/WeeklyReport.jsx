import { useContext, useEffect, useState } from "react";
import { MainContext } from "../Helpers/Context";
import "./weeklyreport.css";
import { MultiSelect } from "primereact/multiselect";
import ReactHTMLTableToExcel from "react-html-table-to-excel";
import { Calendar } from "primereact/calendar";
import { Button } from "primereact/button";
import { Ripple } from "primereact/ripple";
import { Dropdown } from "primereact/dropdown";
import { useNavigate } from "react-router-dom";
const Weekly = () => {
  const [filteredClass, setFilteredClass] = useState([]);
  const [classes, setClasses] = useState([]);
  const [terms, setTerms] = useState([]);
  const [sessions, setSessions] = useState([]);
  const [filteredDate, setFilteredDate] = useState("");
  const [filteredSess, setFilteredSess] = useState("");
  const [filteredTerm, setFilteredTerm] = useState("");
  const [weekly, setWeekly] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [sort, setSort] = useState("DOG");
  let { url, notifications, loggedSchool } = useContext(MainContext);
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
            let testTerm = newCls.terms.split(",");
            let setClass = async () => {
              testClass = await testClass.map((classe) => {
                return { name: classe.toUpperCase() };
              });
              testTerm = await testTerm.map((term) => term.toUpperCase());
              return {
                testClass,
                testTerm,
              };
            };
            // setClasses(setClass().then((data) => data));
            setClass().then(({ testClass, testTerm }) => {
              setClasses(testClass);
              // console.log(testClass);
              setTerms(testTerm);
            });
            // console.log(classes);
            // setTerms(newCls.terms.split(","));
            setSessions(newCls.sessions.split(","));
            setFilteredSess(newCls.current_session);
            setFilteredTerm(newCls.current_term.toUpperCase());
          } catch {
            notifications.warning("failed to set datas. Try reloading");
          }
        }
      })

      .catch((err) => console.log(err));
  };
  useEffect(() => {
    fetchFilters();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [document.readyState]);

  // let focusSelect = () => {
  //   let tempArr = [];
  //   if (!classes[0]?.label) {
  //     classes.map((label) => {
  //       label = label?.toUpperCase();
  //       tempArr.push({ label, value: label });
  //       console.log(label);
  //       return 0;
  //     });
  //     console.log(tempArr);
  //     setClasses(tempArr);
  //   }
  // };

  let createWeek = (e) => {
    e.preventDefault();
    if (
      filteredClass.length === 0 ||
      filteredTerm === "" ||
      filteredSess === "" ||
      filteredDate === ""
    ) {
      notifications.warning("Enter all important fields", "hhdh");
      return;
    } else {
      setIsLoading(true);
      let value = filteredClass.map((val) => val.name.toLowerCase());
      fetch(`${url}/main/records/weekly`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          classes: value,
          date: filteredDate,
          term: filteredTerm.toLowerCase(),
          sess: filteredSess,
          sort: sort.toLowerCase().trim(),
        }),
        credentials: "include",
      })
        .then((res) => res.json())
        .then((data) => {
          setIsLoading(false);
          if (data?.status) {
            let sortWeek = data?.message?.weekly;
            let sortOthers = data?.message?.others;
            let newWeek = [];
            sortWeek?.forEach((week) => {
              let element = sortOthers?.find(
                (other) => week?.class === other?.class
              );
              sortOthers?.forEach((oth, index) => {
                if (element?.class === oth?.class) {
                  sortOthers?.splice(index, 1);
                }
              });

              // console.log(sortOthers);
              // console.log(element);
              newWeek.push({
                ...week,
                overallBus: element?.overallBus,
                onlyBus: false,
              });
            });
            if (sortOthers.length !== 0) {
              sortOthers?.map((other) =>
                newWeek.push({ ...other, onlyBus: true })
              );
            }
            setWeekly(newWeek);
          }
        })
        .catch((err) => {
          setIsLoading(false);
          console.log(err);
        });
    }
  };
  return (
    <div className="__weekly">
      <Button
        text
        size="small"
        icon="pi pi-fw pi-arrow-left"
        className="p-button-rounded"
        onClick={() => navigate(-1)}
      ></Button>
      <h2>Weekly Report</h2>
      <form className="search-container container">
        <Calendar
          value={filteredDate}
          onChange={(e) => setFilteredDate(e.value)}
          required
          // onClick={() => focusSelect()}
          placeholder="Select day for the week"
          showButtonBar
          icon="pi pi-calendar"
          showIcon
        />
        <MultiSelect
          value={filteredClass}
          onChange={(e) => setFilteredClass(e.value)}
          options={classes}
          placeholder="Select a class"
          id="class"
          optionLabel="name"
          display="chip"
          className="w-full md:w-20rem"
          filter
        ></MultiSelect>
        <Dropdown
          value={filteredTerm}
          onChange={(e) => setFilteredTerm(e.value)}
          className="filter-term"
          options={terms}
          placeholder="Select term"
        />
        {/* <select
        >
          <option value="">Term</option>
          {terms &&
            terms.map((elem) => (
              <option value={elem.toUpperCase()} key={Math.random()}>
                {elem.toUpperCase()}
              </option>
            ))}
        </select> */}
        <Dropdown
          value={filteredSess}
          onChange={(e) => setFilteredSess(e.value)}
          className="filter-sess"
          options={sessions}
          placeholder="Select session"
        />
        <Dropdown
          value={sort}
          onChange={(e) => setSort(e.value)}
          options={["DOP", "DOG"]}
          placeholder="Sort by"
        />

        <div className="btn-cont">
          <Button
            className="btn btn-success btn-sm"
            onClick={(e) => createWeek(e)}
            icon="pi pi-check-circle"
            label="Create"
            loading={isLoading}
            severity="success"
            size="small"
          >
            <Ripple />
          </Button>
        </div>
      </form>
      <div className="weekly-table table-responsive">
        <table className="table table-bordered" id="table-to-xls">
          <thead className="thead">
            <tr className="colspan">
              <th colSpan={6}>
                <h5>{loggedSchool?.toUpperCase()}</h5>
              </th>
            </tr>
            <tr className="colspan">
              <th colSpan={6}>
                {filteredTerm?.toUpperCase()} FEE WEEKLY RECORD
              </th>
            </tr>
            <tr className="colspan">
              <th colSpan={6}>DATE: {new Date(Date.now())?.toDateString()}</th>
            </tr>
            {filteredClass?.length !== 0 && (
              <tr className="colspan">
                {filteredClass?.length !== 0 && (
                  <th colSpan={6}>
                    {filteredClass?.map((clas, index) => (
                      <span key={Math.random() + clas?.name}>
                        {clas?.name}
                        {filteredClass.length - 1 !== index && ", "}
                      </span>
                    ))}
                  </th>
                )}
              </tr>
            )}
            <tr>
              <th>CLASS</th>
              <th>TUITION</th>
              <th>LESSON</th>
              <th>BUS</th>
              <th>PTA</th>
              <th>TOTAL</th>
            </tr>
          </thead>
          <tbody className="tbody">
            {isLoading ? (
              <tr className="loading">
                <td colSpan={6} style={{ textAlign: "center" }}>
                  loading...
                </td>
              </tr>
            ) : weekly.length === 0 ? (
              <tr className="loading">
                <td colSpan={6} style={{ textAlign: "center" }}>
                  No records available
                </td>
              </tr>
            ) : (
              weekly.map((week) => (
                <tr key={week?.class + new Date() + Math.random()}>
                  <td>{week?.class}</td>
                  <td>{week?.totalTuition?.toLocaleString() || "0"}</td>
                  <td>{week?.totalLesson?.toLocaleString() || "0"}</td>
                  <td>{week?.overallBus?.toLocaleString() || "0"}</td>
                  <td>{week?.totalPTA?.toLocaleString() || "0"}</td>
                  <td>
                    {week?.overallBus
                      ? (
                          parseInt(week?.overTotal) + parseInt(week?.overallBus)
                        )?.toLocaleString()
                      : parseInt(week?.overTotal)?.toLocaleString()}
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>
      <ReactHTMLTableToExcel
        id="xls-button"
        className="xls-button btn btn-dark btn-sm"
        table="table-to-xls"
        filename={
          "Weekly Report".replace(/ /g, "_") +
          "_" +
          new Date(Date.now()).toLocaleTimeString().replace(/ /g, "_")
        }
        sheet="tablexls"
        buttonText="Download XLS"
      />
    </div>
  );
};

export default Weekly;
