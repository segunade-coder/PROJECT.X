import { useEffect, useContext, useState, useRef } from "react";
import "./dashboard.css";
import { MainContext } from "../Helpers/Context";
import Box from "../../small_comps/box/Box";
import ModalCont from "../../small_comps/modal/ModalCont";
import { OrderList } from "primereact/orderlist";
import { Button } from "primereact/button";
import { useNavigate } from "react-router-dom";
import { Inplace, InplaceContent, InplaceDisplay } from "primereact/inplace";
const Dashboard = () => {
  // declaring state variables
  let { loggedSchool, url, admin } = useContext(MainContext); // variables shared among all the files from main.jsx
  const [totalStudent, setTotalStudent] = useState("");
  const [totalMonth, setTotalMonth] = useState(0);
  const [totalYear, setTotalYear] = useState(0);
  const [Month, setMonth] = useState("");
  const [Year, setYear] = useState("");
  const [debt, setDebt] = useState(0);
  const [totalClass, setTotalClass] = useState(0);
  const [totalTerm, setTotalTerm] = useState(0);
  const [todayCollection, setTodayCollection] = useState(0);
  const [debtOfClasses, setDebtOfClasses] = useState([]);
  const [totalForEachClass, setTotalForEachClass] = useState([]);
  const navigate = useNavigate();
  let countFetch = useRef(0);
  useEffect(() => {
    // fetch details of dashboar usng async function before the page loads
    if (countFetch.current === 0) {
      fetch(`${url}/main/dashboard`, {
        credentials: "include",
        headers: {
          "Content-Type": "application/json",
        },
        method: "GET",
      })
        .then((res) => res.json())
        .then((data) => {
          if (data.status) {
            // check is status is true

            // set variables with the data gotten if only status is true
            let formatter = new Intl.NumberFormat(undefined, {
              // currency: "USD",
              // style: "currency",
              notation: "compact",
              minimumFractionDigits: 2,
              maximumFractionDigits: 2,
            });
            setTotalStudent(data.message);
            setMonth(data.month[0]?.month_payment || 0);
            setYear(data.year[0]?.year_payment || 0);
            setTotalMonth(formatter.format(Number(data.month[0]?.total || 0)));
            setTotalYear(formatter.format(Number(data.year[0]?.total || 0)));
            setTotalTerm(formatter.format(Number(data?.totalTerm)));
            setDebtOfClasses(data.debts);
            setTotalForEachClass(data.totalEachClass);
            setTotalClass(data.classes);
            setTodayCollection(data.totalCollection);
            let sumofDebt = 0;
            data.debts.map((h) => {
              sumofDebt += h.debt;
            });
            setDebt(formatter.format(Number(sumofDebt)));
          }
        })
        .catch((err) => console.log(err));
    }
    countFetch.current += 1;

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [countFetch]);

  let showModal = (id) => {
    document.getElementsByClassName(id)[0].classList.add("show-modal");
    document.body.style.overflow = "hidden";
    window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
  };
  const itemTemplate = (item) => {
    return (
      <div className="flex flex-wrap p-2 align-items-center gap-3">
        <div className="flex-1 flex flex-column gap-2 xl:mr-8">
          <span className="font-bold" style={{ fontWeight: "bold" }}>
            {item.class?.toUpperCase()}
          </span>
          {": "}
          <span className="font-bold">{item.debt.toLocaleString("en-US")}</span>
        </div>
      </div>
    );
  };
  return (
    <div className="__dashboard">
      <h2>Dashboard</h2>
      <p>Welcome to {loggedSchool} School Fee Record System</p>
      <br />
      <div className="container">
        <Box style={{ backgroundColor: "#eee" }}>
          <div className="content">
            <h5>Active Students</h5>
            <i className="pi pi-users" style={{ fontSize: 30 }}></i>
            <div>
              <Inplace>
                <InplaceDisplay>****</InplaceDisplay>
                <InplaceContent>
                  <b>{totalStudent || "0"} </b>
                </InplaceContent>
              </Inplace>
            </div>
          </div>
        </Box>
        {admin && (
          <>
            <Box style={{ backgroundColor: "wheat" }}>
              <div className="content" title={Month}>
                <h5>Monthly Fee</h5>
                <i className="pi pi-money-bill" style={{ fontSize: 30 }}></i>
                <div>
                  <Inplace>
                    <InplaceDisplay>****</InplaceDisplay>
                    <InplaceContent>
                      <b>{totalMonth?.toLocaleString() || "0"}</b>
                    </InplaceContent>
                  </Inplace>
                </div>
              </div>
            </Box>
            <Box style={{ backgroundColor: "#eee" }}>
              <div className="content" title={Year}>
                <h5>Yearly Fee </h5>
                <i className="pi pi-box" style={{ fontSize: 30 }}></i>
                <div>
                  <Inplace>
                    <InplaceDisplay>****</InplaceDisplay>
                    <InplaceContent>
                      <b>{totalYear?.toLocaleString() || "0"}</b>
                    </InplaceContent>
                  </Inplace>
                </div>
              </div>
            </Box>
          </>
        )}
        <Box style={{ backgroundColor: "#c5d7e5" }}>
          <div className="content">
            <h5>Total Class </h5>
            <i className="pi pi-calendar" style={{ fontSize: 30 }}></i>
            <div>
              <Inplace>
                <InplaceDisplay>****</InplaceDisplay>
                <InplaceContent>
                  <b>{totalClass || "0"}</b>
                </InplaceContent>
              </Inplace>
            </div>
          </div>
        </Box>
        {admin && (
          <>
            <Box style={{ backgroundColor: "wheat", cursor: "pointer" }}>
              <div className="content">
                <h5>Debt for the Term </h5>
                <i
                  className="pi pi-arrow-down-left"
                  style={{ fontSize: 20 }}
                ></i>
                <div>
                  <Inplace>
                    <InplaceDisplay>****</InplaceDisplay>
                    <InplaceContent>
                      <b>{debt?.toLocaleString() || "0"}</b>
                    </InplaceContent>
                  </Inplace>
                </div>
                <small onClick={() => showModal("debt-details")}>
                  Click to expand
                </small>
              </div>
            </Box>

            <Box style={{ backgroundColor: "#c5d7e5", cursor: "pointer" }}>
              <div className="content">
                <h5>Total for Term </h5>
                <i className="pi pi-calculator" style={{ fontSize: 30 }}></i>
                <div>
                  <Inplace>
                    <InplaceDisplay>****</InplaceDisplay>
                    <InplaceContent>
                      <b>{totalTerm?.toLocaleString() || "0"}</b>
                    </InplaceContent>
                  </Inplace>
                </div>
                <small onClick={() => showModal("total-details")}>
                  Click to expand
                </small>
              </div>
            </Box>
            <Box style={{ backgroundColor: "wheat" }}>
              <div className="content">
                <h5>Todays Collection </h5>
                <i className="pi pi-calculator" style={{ fontSize: 30 }}></i>
                <div>
                  <Inplace>
                    <InplaceDisplay>****</InplaceDisplay>
                    <InplaceContent>
                      <b>{todayCollection?.toLocaleString() || "0"}</b>
                    </InplaceContent>
                  </Inplace>
                </div>
              </div>
            </Box>
          </>
        )}
        <Box style={{ backgroundColor: "#eee" }}>
          <div className="content">
            <h5>Total Staff</h5>
            <i className="pi pi-users" style={{ fontSize: 30 }}></i>
            <p>
              <b>0</b>
            </p>
          </div>
        </Box>
      </div>

      <ModalCont
        title={`Each class debt`}
        classModal="debt-details"
        notShowSave={true}
      >
        <div className="details-container">
          <div className="card xl:flex xl:justify-content-center">
            <OrderList
              value={debtOfClasses}
              itemTemplate={itemTemplate}
              header="Each class Debt"
              filter
              filterBy="class"
            ></OrderList>
            <Button
              onClick={() => navigate("expand-debt")}
              label="see more"
              size="small"
              icon="pi pi-fw pi-search"
              link
            />
          </div>
        </div>
      </ModalCont>
      <ModalCont
        title={`Total for each class`}
        classModal="total-details"
        notShowSave={true}
      >
        <div className="details-container">
          <div className="card xl:flex xl:justify-content-center">
            <OrderList
              value={totalForEachClass}
              itemTemplate={itemTemplate}
              header="Each class total"
              filter
              filterBy="class"
            ></OrderList>
          </div>
        </div>
      </ModalCont>
    </div>
  );
};

export default Dashboard;
