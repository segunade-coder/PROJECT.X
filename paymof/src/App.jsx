import { Suspense } from "react";
import "./App.css";
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate,
} from "react-router-dom";
import "primereact/resources/themes/lara-light-blue/theme.css";
import "primereact/resources/primereact.min.css";
import "primeicons/primeicons.css";
import Loader from "./components/small_comps/loader/Loader.jsx";
import Users from "./components/Main/users/Users.jsx";
import ErrorBoundary from "./components/small_comps/ErrorBoundary.jsx";
import Autologout from "./components/Main/Autologout";
import {
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
} from "./routes.js";

function App() {
  return (
    <Router>
      <div className="App">
        <Suspense fallback={<Loader />}>
          <Routes>
            <Route
              path="index"
              element={
                <ErrorBoundary>
                  <Index />
                </ErrorBoundary>
              }
            />

            <Route
              path="login"
              element={
                <ErrorBoundary>
                  <Login />
                </ErrorBoundary>
              }
            />
            <Route path="admin/12345" element={<Cpanel />} />
            <Route
              path="login/:school"
              element={
                <ErrorBoundary>
                  <CustomLogin />
                </ErrorBoundary>
              }
            />
            <Route
              path=":school"
              element={
                <ErrorBoundary>
                  <Autologout>
                    <Main />
                  </Autologout>
                </ErrorBoundary>
              }
            >
              <Route
                path=""
                element={
                  <ErrorBoundary>
                    <Dashboard />
                  </ErrorBoundary>
                }
              />
              <Route
                path="dashboard"
                element={
                  <ErrorBoundary>
                    <Dashboard />
                  </ErrorBoundary>
                }
              />
              <Route
                path="dashboard/expand-debt"
                element={
                  <ErrorBoundary>
                    <ExpandDebt />
                  </ErrorBoundary>
                }
              />
              <Route
                path="students"
                element={
                  <ErrorBoundary>
                    <Students />
                  </ErrorBoundary>
                }
              />
              <Route
                path="fees"
                element={
                  <ErrorBoundary>
                    <Fees />
                  </ErrorBoundary>
                }
              />
              <Route
                path="records"
                element={
                  <ErrorBoundary>
                    <Records />
                  </ErrorBoundary>
                }
              />
              <Route
                path="profile"
                element={
                  <ErrorBoundary>
                    <Profile />
                  </ErrorBoundary>
                }
              />
              <Route
                path="wallet"
                element={
                  <ErrorBoundary>
                    <Wallet />
                  </ErrorBoundary>
                }
              />
              <Route
                path="wallet-history"
                element={
                  <ErrorBoundary>
                    <ExpensesHistory />
                  </ErrorBoundary>
                }
              />
              <Route
                path="payment"
                element={
                  <ErrorBoundary>
                    <Payment />
                  </ErrorBoundary>
                }
              />
              <Route
                path="settings"
                element={
                  <ErrorBoundary>
                    <Settings />
                  </ErrorBoundary>
                }
              />
              <Route
                path="users"
                element={
                  <ErrorBoundary>
                    <Users />
                  </ErrorBoundary>
                }
              />
              <Route
                path="debtors"
                element={
                  <ErrorBoundary>
                    <Debtors />
                  </ErrorBoundary>
                }
              />
              <Route
                path="notifications"
                element={
                  <ErrorBoundary>
                    <Notifications />
                  </ErrorBoundary>
                }
              />
              <Route
                path="backup"
                element={
                  <ErrorBoundary>
                    <Backup />
                  </ErrorBoundary>
                }
              />
              <Route
                path="weekly-report"
                element={
                  <ErrorBoundary>
                    <WeeklyReport />
                  </ErrorBoundary>
                }
              />
              <Route
                path="statement"
                element={
                  <ErrorBoundary>
                    <Statement />
                  </ErrorBoundary>
                }
              />
            </Route>
            <Route path="" element={<Navigate to="login" />} />
            <Route
              path="authentication"
              element={
                <ErrorBoundary>
                  <NotLogged />
                </ErrorBoundary>
              }
            />
            <Route
              path="authorization"
              element={
                <ErrorBoundary>
                  <NotAuthorize />
                </ErrorBoundary>
              }
            />
            <Route
              path="*"
              element={
                <ErrorBoundary>
                  <ErrorPage />
                </ErrorBoundary>
              }
            />
          </Routes>
        </Suspense>
      </div>
    </Router>
  );
}

export default App;
