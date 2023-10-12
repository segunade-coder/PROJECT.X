import { useContext, useEffect, useState } from "react";
import { MainContext } from "../Helpers/Context";
import ReactHTMLTableToExcel from "react-html-table-to-excel";
import { DataTable } from "primereact/datatable";
import { Column } from "primereact/column";
import { Button } from "primereact/button";
import { Dropdown } from "primereact/dropdown";
import { useNavigate } from "react-router-dom";

const ExpensesHistory = () => {
  const [history, setHistory] = useState([]);
  const [wallets, setWallets] = useState([]);
  const [defaultWallet, setDefaultWallet] = useState({ name: "CURRENT" });
  let { url, notifications } = useContext(MainContext);
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
  let fetchHistory = () => {
    fetch(
      `${url}/main/settings/expense/history?wallet=${defaultWallet.name
        ?.toLowerCase()
        ?.trim()}`,
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
        if (data.status) {
          setHistory(data.message);
        } else {
          notifications.warning(data.message);
        }
      })
      .catch((err) => {
        console.log(err);
        notifications.warning("Something went wong. Try refreshing");
      });
  };
  useEffect(() => {
    fetchHistory();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [defaultWallet]);
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
  let formatter = Intl.NumberFormat(undefined, {
    // notation: "",
    minimumFractionDigits: 0,
    maximumFractionDigits: 2,
  });
  const paginatorLeft = (
    <Button
      type="button"
      icon="pi pi-refresh"
      text
      onClick={() => fetchHistory()}
    />
  );
  const paginatorRight = (
    <Button
      type="button"
      icon="pi pi-download"
      text
      onClick={() => document.getElementById("xls-button").click()}
    />
  );
  let dateBodytemplate = (hist) => {
    return formatDate(hist.created_at);
  };
  let amountBeforeBodytemplate = (hist) => {
    return formatter.format(hist.amount_before);
  };
  let amountAfterBodytemplate = (hist) => {
    return formatter.format(hist.amount_after);
  };
  let amount = (hist) => {
    return formatter.format(hist.amount);
  };
  return (
    <div className="__history">
      <Button
        text
        size="small"
        icon="pi pi-fw pi-arrow-left"
        className="p-button-rounded"
        onClick={() => navigate(-1)}
      ></Button>
      <h2 className="h3">Expense History</h2>
      <Dropdown
        value={defaultWallet}
        onChange={(e) => setDefaultWallet(e.value)}
        options={wallets}
        placeholder="Select wallet"
        optionLabel="name"
        id="to"
      ></Dropdown>
      <div className="card mt-3">
        <DataTable
          value={history}
          paginator
          rows={10}
          tableStyle={{
            minWidth: "50rem",
            fontFamily: "Poppins-Regular",
          }}
          rowsPerPageOptions={[5, 10, 25, 50, 100, 200]}
          paginatorTemplate="RowsPerPageDropdown FirstPageLink prevPageLink CurrentPageReport NextPageLink LastPageLink"
          currentPageReportTemplate="{first} to {last} of {totalRecords}"
          paginatorLeft={paginatorLeft}
          paginatorRight={paginatorRight}
          sortMode="multiple"
          sortField="id"
          removableSort
          size="small"
        >
          <Column
            field="id"
            header="S/N"
            style={{ width: "25%", textTransform: "uppercase" }}
          ></Column>
          <Column
            field="wallet"
            header="Wallet"
            style={{ width: "25%", textTransform: "uppercase" }}
            sortable
          ></Column>
          <Column
            body={amount}
            header="Amount"
            style={{ width: "25%", textTransform: "uppercase" }}
            sortable
          ></Column>
          <Column
            body={amountBeforeBodytemplate}
            header="Amount Before"
            style={{ width: "25%", textTransform: "uppercase" }}
            sortable
          ></Column>
          <Column
            body={amountAfterBodytemplate}
            header="Amount After"
            style={{ width: "25%", textTransform: "uppercase" }}
            sortable
          ></Column>
          <Column
            field="description"
            header="Description"
            style={{ width: "25%", textTransform: "uppercase" }}
            sortable
          ></Column>
          <Column
            field="accountant"
            header="Accountant"
            style={{ width: "25%", textTransform: "uppercase" }}
            sortable
          ></Column>
          <Column
            // field="created_at"
            body={dateBodytemplate}
            header="Date"
            sortable
            style={{ width: "25%", textTransform: "uppercase" }}
          ></Column>
        </DataTable>
      </div>
      <div className="" style={{ display: "none" }}>
        <table className="" id="table-to-xls" style={{ display: "none" }}>
          <thead>
            <tr>
              <th>S/N</th>
              <th>Wallet </th>
              <th>Amount</th>
              <th>Amount before</th>
              <th>Amount after</th>
              <th>Description</th>
              <th>Accountant</th>
              <th>Date</th>
            </tr>
          </thead>
          <tbody>
            {history.map((his, i) => (
              <tr key={his.created_at + i}>
                <td>{i + 1}</td>
                <td>{his.wallet}</td>
                <td>{Number(his.amount?.toLocaleString())}</td>
                <td>{Number(his.amount_before?.toLocaleString())}</td>
                <td>{Number(his.amount_after?.toLocaleString())}</td>
                <td>{his.description}</td>
                <td>{his.accountant}</td>
                <td>{formatDate(his.created_at)}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      <ReactHTMLTableToExcel
        id="xls-button"
        className="xls-button d-none"
        table="table-to-xls"
        filename={"Expenses History " + formatDate(new Date())}
        sheet="tablexls"
        buttonText="Download XLS"
      />
    </div>
  );
};

export default ExpensesHistory;
