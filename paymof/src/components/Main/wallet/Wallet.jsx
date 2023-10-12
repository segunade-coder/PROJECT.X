import "./wallet.css";
import { useContext, useEffect, useState } from "react";
import { MainContext } from "../Helpers/Context";
import { Toaster } from "react-hot-toast";
import ModalCont from "../../small_comps/modal/ModalCont";
import { InputNumber } from "primereact/inputnumber";
import { Dropdown } from "primereact/dropdown";
import { SpeedDial } from "primereact/speeddial";
import { Tooltip } from "primereact/tooltip";
// import { InputTextarea } from "primereact/inputtextarea";
import { Chart } from "primereact/chart";
import { useNavigate } from "react-router-dom";
import { Inplace, InplaceContent, InplaceDisplay } from "primereact/inplace";
import { Button } from "primereact/button";
const Wallet = () => {
  let { url, notifications, loggedUser } = useContext(MainContext);
  const [wallets, setWallets] = useState([]);
  const [walletsDisplay, setWalletsDisplay] = useState([]);
  const [Defaultwallet, setDefaultWallet] = useState("");
  const [addWallet, setAddWallet] = useState("");
  const [transferFrom, setTransferFrom] = useState({ name: "" });
  const [transferTo, setTransferTo] = useState({ name: "" });
  const [transferAmount, setTransferAmount] = useState(0);
  const [addWalletStatus, setAddWalletStatus] = useState(false);
  const [changeDefaultWallet, setChangeDefaultWallet] = useState({ name: "" });
  const [expenseAmount, setExpenseAmount] = useState(0);
  const [expenseWalletDeduction, setExpenseWalletDeduction] = useState({
    name: "",
  });
  const [expenseDescription, setExpenseDescription] = useState("");
  const [chartData, setChartData] = useState({});
  const [chartOptions, setChartOptions] = useState({});
  const [chartData2, setChartData2] = useState({});
  const [chartOptions2, setChartOptions2] = useState({});
  const [chartWallet, setChartWallet] = useState({ name: "" });
  const [summaryDetails, setSummaryDetails] = useState([]);
  const [chartOpt, setChartOpt] = useState({ name: "TOTAL AMOUNT" });
  // let formatter = new Intl.NumberFormat(undefined, {
  //   // currency: "USD",
  //   style: "currency",
  //   minimumFractionDigits: 2,
  //   maximumFractionDigits: 2,
  // });
  const navigate = useNavigate();

  let fetchWallets = () => {
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
          try {
            let testWallet = new Map(JSON?.parse(newCls?.wallets));
            let setClass = async () => {
              testWallet = await [...testWallet].map((wallet) => {
                return { name: wallet[0].toUpperCase() };
              });
              return {
                testWallet,
              };
            };
            // setClasses(setClass().then((data) => data));
            setClass().then(({ testWallet }) => {
              setWallets(testWallet);
            });
            setDefaultWallet({
              name: newCls?.default_wallets?.toUpperCase(),
            });
            setWalletsDisplay(new Map(JSON?.parse(newCls?.wallets)));
            setDefaultWallet(newCls?.default_wallets?.toUpperCase());
            setChangeDefaultWallet({
              name: newCls?.default_wallets?.toUpperCase(),
            });
            setExpenseWalletDeduction({
              name: newCls?.default_wallets?.toUpperCase(),
            });
            setChartWallet({
              name: newCls?.default_wallets?.toUpperCase(),
            });
          } catch {
            notifications.warning("Failed to set data", "jfjie9w");
          }
        }
      })

      .catch((err) => console.log(err));
  };
  useEffect(() => {
    fetchWallets();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [document.readyState]);

  useEffect(() => {
    if (chartWallet !== "") {
      fetch(`${url}/main/settings/chartData`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
        body: JSON.stringify({
          chartWallet: chartWallet.name?.toLowerCase().trim(),
          option: chartOpt.name?.toLowerCase().trim(),
        }),
      })
        .then((res) => res.json())
        .then((response) => {
          if (response.status) {
            // const documentStyle = getComputedStyle(document.documentElement);
            setSummaryDetails([
              response.income,
              response.expenses,
              response.profit,
            ]);
            // console.log(summaryDetails);
            const data = {
              labels: ["Income", "Expenses"],
              datasets: [
                {
                  data: [response.income, response.expenses],
                  backgroundColor: [
                    "rgba(75, 192, 192, 0.2)",
                    "rgba(255, 159, 64, 0.2)",
                  ],
                  borderColor: ["rgb(75, 192, 192)", "rgb(255, 159, 64)"],
                  borderWidth: 1,
                  label: chartWallet.name,
                },
              ],
            };
            const documentStyle = getComputedStyle(document.documentElement);
            const data2 = {
              labels: ["Income", "Expenses", "Profit"],
              datasets: [
                {
                  data: [response.income, response.expenses, response.profit],
                  backgroundColor: [
                    documentStyle.getPropertyValue("--blue-500"),
                    documentStyle.getPropertyValue("--red-500"),
                    response.profit >= 0
                      ? documentStyle.getPropertyValue("--green-500")
                      : documentStyle.getPropertyValue("--red-700"),
                  ],
                  hoverBackgroundColor: [
                    documentStyle.getPropertyValue("--blue-400"),
                    documentStyle.getPropertyValue("--red-400"),
                    response.profit >= 0
                      ? documentStyle.getPropertyValue("--green-400")
                      : documentStyle.getPropertyValue("--red-600"),
                  ],
                },
              ],
            };
            const options2 = {
              cutout: "60%",
            };
            const options = {
              scales: {
                y: {
                  beginAtZero: true,
                },
              },
            };
            setChartData(data);
            setChartData2(data2);
            setChartOptions2(options2);
            setChartOptions(options);
          }
        });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [chartWallet, url, chartOpt]);

  let saveWallet = () => {
    if (addWallet === "") {
      notifications.warning("Enter wallet name!", "gjgjg");
    } else {
      if (addWallet.length > 20) {
        notifications.warning("Wallet name to long", "hsoajr");
        return;
      }
      if (addWallet.length < 3) {
        notifications.warning("Wallet name to short", "hsoajr");
        return;
      }
      setAddWalletStatus(true);
      fetch(`${url}/main/settings/add-wallet`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
        body: JSON.stringify({
          walletName: addWallet.toLowerCase().trim(),
        }),
      })
        .then((res) => res.json())
        .then((data) => {
          setAddWalletStatus(false);
          if (data.status) {
            notifications.success(data.message);
            document
              .getElementsByClassName("wallet-add-modal")[0]
              .classList.remove("show-modal");
            document.body.style.overflow = "auto";
            document.body.style.top = "";
            fetchWallets();
            return;
          } else {
            notifications.warning(data.message);
          }
        })
        .catch((err) => {
          console.log(err);
          notifications.warning("Something went wrong. Try refreshing.");
        });
    }
  };

  let saveDefaultWallet = () => {
    if (changeDefaultWallet.name !== "") {
      setAddWalletStatus(true);
      fetch(`${url}/main/settings/switch-default`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
        body: JSON.stringify({
          default: changeDefaultWallet.name.toLowerCase().trim(),
        }),
      })
        .then((res) => res.json())
        .then((data) => {
          setAddWalletStatus(false);
          if (data.status) {
            notifications.success(data.message);
            setDefaultWallet(changeDefaultWallet.name);
            document
              .getElementsByClassName("switch-modal")[0]
              .classList.remove("show-modal");
            document.body.style.overflow = "auto";
            document.body.style.top = "";
            return;
          } else {
            notifications.warning(data.message);
          }
        })
        .catch((err) => {
          console.log(err);
          notifications.warning("Something went wrong. Try refreshing.");
        });
    }
  };

  let transferFunds = () => {
    // console.log(transferFrom, transferTo);
    if (
      transferFrom.name === "" ||
      transferTo.name === "" ||
      transferAmount === ""
    ) {
      notifications.warning("Fill in required fields");
      return;
    } else {
      if (transferFrom.name === transferTo.name) {
        notifications.warning("Cannot transfer to same wallet");
        return;
      }
      if (transferAmount <= 99) {
        notifications.warning("Amount must be greater than 100");
        return;
      }
      fetch(`${url}/main/settings/transfer-funds`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
        body: JSON.stringify({
          from: transferFrom.name.toLowerCase().trim(),
          to: transferTo.name.toLowerCase().trim(),
          amount: Number(parseFloat(transferAmount)),
        }),
      })
        .then((res) => res.json())
        .then((data) => {
          setAddWalletStatus(false);
          if (data.status) {
            notifications.success(data.message);
            document
              .getElementsByClassName("transfer-modal")[0]
              .classList.remove("show-modal");
            document.body.style.overflow = "auto";
            document.body.style.top = "";
            fetchWallets();
            return;
          } else {
            notifications.warning(data.message);
          }
        })
        .catch((err) => {
          console.log(err);
          notifications.warning("Something went wrong. Try refreshing.");
        });
    }
  };
  let showModal = (id) => {
    setAddWallet("");
    setTransferAmount(0);
    setTransferFrom({ name: "" });
    setTransferTo({ name: "" });
    setChangeDefaultWallet({ name: Defaultwallet });
    document.getElementsByClassName(id)[0].classList.add("show-modal");
    document.body.style.overflow = "hidden";
    window.scrollTo(0, parseInt(window.scrollY || "0") * -1);
  };
  let saveAddExpenses = () => {
    if (
      expenseWalletDeduction.name === "" ||
      expenseDescription.trim() === "" ||
      expenseAmount === 0
    ) {
      notifications.warning("Fill in required fields");
      return;
    } else {
      if (expenseAmount <= 9) {
        notifications.warning("Amount must be greater than 10");
        return;
      }
      setAddWalletStatus(true);
      fetch(`${url}/main/settings/add-expense`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
        body: JSON.stringify({
          from: expenseWalletDeduction.name.toLowerCase().trim(),
          description: expenseDescription.toLowerCase().trim(),
          amount: Number(parseFloat(expenseAmount)),
          user: loggedUser.trim().toLowerCase(),
        }),
      })
        .then((res) => res.json())
        .then((data) => {
          setAddWalletStatus(false);

          setAddWalletStatus(false);
          if (data.status) {
            notifications.success(data.message);
            document
              .getElementsByClassName("wallet-add-expense")[0]
              .classList.remove("show-modal");
            document.body.style.overflow = "auto";
            document.body.style.top = "";
            fetchWallets();
            return;
          } else {
            notifications.warning(data.message);
          }
        })
        .catch((err) => {
          console.log(err);
          notifications.warning("Something went wrong. Try refreshing.");
        });
    }
  };
  let walletAmount = (amount) => {
    let formatter = new Intl.NumberFormat(undefined, {
      notation: "compact",
      minimumFractionDigits: 2,
      maximumFractionDigits: 2,
    });
    let num = Number(amount);
    if (num >= 1000000) return formatter.format(num);
    else return num.toLocaleString();
  };
  return (
    <div className="__wallet">
      <div>
        <Toaster position="top-center" reverseOrder={false} />
      </div>
      <h2 className="h2">Wallet</h2>

      <Tooltip
        target=".speedial-bottom-right .p-speeddial-action"
        position="left"
      />
      <SpeedDial
        model={[
          {
            label: "Create wallet",
            icon: "pi pi-plus",
            command: () => {
              showModal("wallet-add-modal");
            },
          },
          {
            label: "Transfer funds",
            icon: "pi pi-uploa pi-arrow-down-right",
            command: () => {
              showModal("transfer-modal");
            },
          },
          {
            label: "Switch default wallet",
            icon: "pi pi-sync",
            command: () => {
              showModal("switch-modal");
            },
          },
        ]}
        direction="left"
        buttonClassName="p-button-secondary p-button-outlined"
        className="speedial-bottom-right"
        showIcon="pi pi-bars"
        hideIcon="pi pi-times"
        transitionDelay={50}
      />
      <div className="wallets">
        <div className="cards-container">
          {walletsDisplay.length !== 0 ? (
            [...walletsDisplay].map((wallet, index) => (
              <div className="card" key={index}>
                <div className="details">
                  <div className="amount">
                    <Inplace>
                      <InplaceDisplay>****</InplaceDisplay>
                      <InplaceContent>{walletAmount(wallet[1])}</InplaceContent>
                    </Inplace>
                  </div>
                  <div className="name">{wallet[0]}</div>
                </div>
                <div className="icon">
                  <i className="pi pi-wallet"></i>
                  {Defaultwallet.toLowerCase() == wallet[0] && (
                    <small>
                      Default <i className="pi pi-circle-on"></i>
                    </small>
                  )}
                </div>
              </div>
            ))
          ) : (
            <div className="card">
              <div className="details">
                <div className="amount">
                  <small>Loading</small>{" "}
                </div>
                <div className="name"></div>
                {/* <small>Default</small> */}
              </div>
              <div className="icon">
                <i className="pi pi-wallet"></i>
              </div>
            </div>
          )}
        </div>
      </div>
      <h2 className="h2 mt-4">Expenses</h2>
      <div className="expenses">
        <div className="add mb-3">
          <i
            className="pi pi-minus"
            style={{
              fontSize: "15px",
              position: "relative",
              left: "25px",
              top: "3px",
              color: "#6a6a6a",
            }}
            onClick={() => showModal("wallet-add-expense")}
          ></i>
          <Button
            icon="pi pi-wallet"
            style={{ fontSize: "20px", color: "#6a6a6a", boxShadow: "none" }}
            onClick={() => showModal("wallet-add-expense")}
            text
            tooltip="Add Expenses"
            className="p-button-rounded"
            tooltipOptions={{
              position: "bottom",
              event: "hover",
              // mouseTrack: true,
              // mouseTrackTop: "15",
            }}
          ></Button>
          <Button
            icon="pi pi-save"
            style={{
              fontSize: "20px",
              color: "#6a6a6a",
              boxShadow: "none",
              marginLeft: "1rem",
            }}
            onClick={() => navigate("../wallet-history")}
            text
            tooltip="View Expense History"
            className="p-button-rounded"
            tooltipOptions={{
              position: "bottom",
              event: "hover",
              // mouseTrack: true,
              // mouseTrackTop: "15",
            }}
          ></Button>
          {/* <span style={{ color: "#5a5a5a" }}>Add</span> */}
        </div>
        <div className="dropdown-wllet-chart">
          <Dropdown
            value={chartWallet}
            onChange={(e) => setChartWallet(e.value)}
            options={wallets}
            placeholder="Select wallet"
            optionLabel="name"
            id="to"
          ></Dropdown>
          <Dropdown
            value={chartOpt}
            onChange={(e) => setChartOpt(e.value)}
            options={[{ name: "TOTAL AMOUNT" }, { name: "CURRENT AMOUNT" }]}
            placeholder="Select wallet"
            optionLabel="name"
            id="opt"
          ></Dropdown>
        </div>
        {chartData.length !== 0 && (
          <div
            className="details-summary mt-2"
            style={{
              display: "flex",
              gap: ".6rem",
              flexWrap: "wrap",
              width: "100%",
            }}
          >
            <span style={{ color: "rgba(75, 192, 192, 1)", flex: "1" }}>
              Income:{" "}
              <small>
                {(summaryDetails[0] &&
                  Number(summaryDetails[0]).toLocaleString()) ||
                  0}
              </small>
            </span>
            <span style={{ color: "rgba(255, 159, 64, 1)", flex: "1" }}>
              Expenses:{" "}
              <small>
                {(summaryDetails[1] &&
                  Number(summaryDetails[1]).toLocaleString()) ||
                  0}
              </small>
            </span>
            <span
              style={{
                color:
                  summaryDetails[2] && summaryDetails[2] >= 0
                    ? getComputedStyle(
                        document.documentElement
                      ).getPropertyValue("--green-500")
                    : getComputedStyle(
                        document.documentElement
                      ).getPropertyValue("--red-500"),
                flex: "1",
              }}
            >
              Profit:{" "}
              <small>
                {summaryDetails[2] && summaryDetails[2] >= 0 && "+"}
                {summaryDetails[2]
                  ? Math.floor(
                      (Number(summaryDetails[2]) /
                        Number(summaryDetails[0] || 1)) *
                        100
                    ).toLocaleString()
                  : "0"}
                %
              </small>
            </span>
          </div>
        )}
        {chartData.length !== 0 && (
          <div className="chart-container mt-3">
            <div className="chart">
              <Chart
                type="bar"
                data={chartData}
                options={chartOptions}
                height="300px"
                width="300px"
              />
            </div>
            <div className="chart">
              <Chart
                type="doughnut"
                data={chartData2}
                options={chartOptions2}
                height="300px"
                width="100%"
              />
            </div>
          </div>
        )}
      </div>
      <ModalCont
        classModal={"wallet-add-modal"}
        btn={"Add"}
        save={saveWallet}
        title="Add student"
        loading={addWalletStatus}
      >
        <form action="">
          <div className="input-cont">
            <label htmlFor="add-wallet">Wallet Name</label>
            <input
              type="text"
              value={addWallet}
              id="add-wallet"
              onChange={(e) => setAddWallet(e.target.value)}
              required
              placeholder="Type name here"
            />
          </div>
        </form>
      </ModalCont>
      <ModalCont
        classModal={"transfer-modal"}
        btn={"Proceed"}
        save={transferFunds}
        title="Transfer funds"
        loading={addWalletStatus}
      >
        <form action="">
          <div className="input-cont">
            <label>Amount</label>
            <InputNumber
              value={transferAmount}
              onChange={(e) => setTransferAmount(e.value)}
              id="amount"
            />
          </div>
          <div className="input-cont">
            <label>Transfer from</label>
            <Dropdown
              value={transferFrom}
              onChange={(e) => setTransferFrom(e?.value)}
              options={wallets}
              placeholder="Select transfer wallet"
              optionLabel="name"
              id="from"
            ></Dropdown>
          </div>
          <div className="input-cont">
            <label>Transfer to</label>
            <Dropdown
              value={transferTo}
              onChange={(e) => setTransferTo(e?.value)}
              options={wallets}
              placeholder="Select transfer to"
              optionLabel="name"
              id="to"
            ></Dropdown>
          </div>
        </form>
      </ModalCont>
      <ModalCont
        classModal={"switch-modal"}
        btn={"Proceed"}
        save={saveDefaultWallet}
        title="Change default wallet"
        loading={addWalletStatus}
      >
        <form action="">
          <div className="input-cont">
            {/* <label>Select default wallet</label> */}
            <Dropdown
              value={changeDefaultWallet}
              onChange={(e) => setChangeDefaultWallet(e.value)}
              options={wallets}
              placeholder="Select wallet"
              optionLabel="name"
              id="to"
            ></Dropdown>
          </div>
        </form>
      </ModalCont>
      <ModalCont
        classModal={"wallet-add-expense"}
        btn={"Proceed"}
        save={saveAddExpenses}
        title="Add Expenses"
        loading={addWalletStatus}
      >
        <form action="">
          <div className="input-cont">
            <InputNumber
              value={expenseAmount}
              onChange={(e) => setExpenseAmount(e.value)}
              id="expense-amount"
            />
          </div>
          <div className="input-cont">
            <Dropdown
              value={expenseWalletDeduction}
              onChange={(e) => setExpenseWalletDeduction(e.value)}
              options={wallets}
              placeholder="Select wallet"
              optionLabel="name"
              id="to"
            ></Dropdown>
          </div>
          <div className="input-cont">
            <textarea
              value={expenseDescription}
              onChange={(e) => setExpenseDescription(e.target.value)}
              rows={3}
              cols={30}
              placeholder="Description of expenses"
            >
              {" "}
            </textarea>
          </div>
        </form>
      </ModalCont>
    </div>
  );
};

export default Wallet;
