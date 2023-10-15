import React from "react";

const Cpanel = React.lazy(() =>
  import("./components/centralControl/Cpanel.jsx")
);

const Index = React.lazy(() => import("./components/index/Index.jsx"));
const ErrorPage = React.lazy(() =>
  import("./components/small_comps/404/ErrorPage.jsx")
);
const Main = React.lazy(() => import("./components/Main/Main.jsx"));
const Dashboard = React.lazy(() =>
  import("./components/Main/dashboard/Dashboard.jsx")
);
const Students = React.lazy(() =>
  import("./components/Main/students/Students.jsx")
);
const Payment = React.lazy(() =>
  import("./components/Main/payments/Payment.jsx")
);
const Settings = React.lazy(() =>
  import("./components/Main/settings/Settings.jsx")
);
const Profile = React.lazy(() =>
  import("./components/Main/settings/Profile.jsx")
);
const NotLogged = React.lazy(() =>
  import("./components/small_comps/NotLogged.jsx")
);
const NotAuthorize = React.lazy(() =>
  import("./components/small_comps/404/NotAuthorize.jsx")
);
const Login = React.lazy(() => import("./components/login/Login.jsx"));
const Fees = React.lazy(() => import("./components/Main/fees/Fees.jsx"));
const CustomLogin = React.lazy(() =>
  import("./components/customLogin/CustomLogin.jsx")
);
const Records = React.lazy(() =>
  import("./components/Main/record/Records.jsx")
);
const Debtors = React.lazy(() =>
  import("./components/Main/debtors/Debtors.jsx")
);
const WeeklyReport = React.lazy(() =>
  import("./components/Main/weeklyReport/WeeklyReport.jsx")
);
const Notifications = React.lazy(() =>
  import("./components/Main/notifications/Notifications.jsx")
);
const Backup = React.lazy(() => import("./components/Main/backup/Backup.jsx"));
const Wallet = React.lazy(() => import("./components/Main/wallet/Wallet.jsx"));
const Statement = React.lazy(() =>
  import("./components/Main/Statement/Statement.jsx")
);
const ExpensesHistory = React.lazy(() =>
  import("./components/Main/expenses/ExpensesHistory.jsx")
);
const ExpandDebt = React.lazy(() =>
  import("./components/Main/expandDebt/ExpandDebt.jsx")
);

export {
  Cpanel,
  Index,
  Login,
  CustomLogin,
  ErrorPage,
  Main,
  Dashboard,
  Students,
  Payment,
  Settings,
  Profile,
  NotLogged,
  NotAuthorize,
  Fees,
  Records,
  Debtors,
  WeeklyReport,
  Notifications,
  Wallet,
  Backup,
  Statement,
  ExpensesHistory,
  ExpandDebt,
};
