/* eslint-disable react/no-unescaped-entities */
import "./index.css";
// import logo from "../../images/new_logo.png";
// import calc_logo from "../../images/calc_logo.png";
import { useState } from "react";
import { useNavigate } from "react-router-dom";
import toast, { Toaster } from "react-hot-toast";
import { useSpring, animated } from "@react-spring/web";
import {
  RiGithubFill,
  RiGoogleFill,
  RiInstagramFill,
  RiLinkedinBoxFill,
  RiTwitterFill,
} from "react-icons/ri";
import notifications from "../Main/Helpers/Notifications";
import { InputText } from "primereact/inputtext";
import { Button } from "primereact/button";
import { Password } from "primereact/password";
import { Ripple } from "primereact/ripple";

const Index = () => {
  let navigate = useNavigate();
  document.title = "Index | Paymof";
  const [schoolName, setSchoolName] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [showElem, setShowElem] = useState(true);
  const [adminName, setAdminName] = useState("");
  const [adminCode, setAdminCode] = useState("");
  const [phone, setPhone] = useState("");
  const [email, setEmail] = useState("");
  const [customLogin, setCustomLogin] = useState(true);

  const [url] = useState(notifications.url);

  const textProps = useSpring({
    opacity: 1,
    transform: "translateY(0)",
    from: { opacity: 0, transform: "translateY(-50px)" },
  });

  const buttonProps = useSpring({
    opacity: 1,
    transform: "translateX(0)",
    from: { opacity: 0, transform: "translateX(-50px)" },
  });

  const handleSchoolName = (e) => {
    e.preventDefault();
    if (schoolName.trim()) {
      setIsLoading(true);
      let uniqid2 = "thissj";
      toast.loading("Loading...", { id: uniqid2 });
      fetch(
        `${url}/reg/school?school_name=${schoolName
          .toLowerCase()
          .trim()
          .replace(/ /g, "-")}`,
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
          setIsLoading(false);
          toast.dismiss(uniqid2);
          if (data.status) {
            // setError(true);
            toast.error(data.message);
            return;
          } else {
            // setError(false);
            setShowElem(true);
          }
        })
        .catch((err) => {
          toast.dismiss(uniqid2);
          console.log(err);
          toast.error("Something went wrong. Try refreshing");
          setIsLoading(false);
        });
    } else {
      setIsLoading(false);
      toast.error("Invalid School Name", { id: "233" });
    }
  };
  const handleAdminCred = (e) => {
    e.preventDefault();
    if (adminCode == "" || adminName == "" || email == "" || phone == "") {
      // setError(true);
      toast.error("Invalid credentials provided");
      return;
    }
    setIsLoading(true);
    let uniqid = "hjsnks";
    toast.loading("Loading...", { id: uniqid });
    let navigate_school = schoolName.replace(/ /g, "-").toLowerCase();

    fetch(`${url}/reg/admin-reg`, {
      method: "POST",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        schoolName: schoolName,
        adminName: adminName,
        adminCode: adminCode,
        email,
        phone,
        customLogin: customLogin ? `/${navigate_school}` : false,
      }),
    })
      .then((res) => res.json())
      .then((data) => {
        setIsLoading(false);
        if (data.status) {
          // setError(data.error);
          toast.error(data.message, { id: uniqid });
          return;
        }
        toast.success("Success!", { id: uniqid });
        if (customLogin) {
          navigate(`/login/${navigate_school}`, {
            state: {
              school_name: schoolName,
              adminName: adminName,
              adminCode: adminCode,
            },
          });
        } else {
          navigate(`/login`, {
            state: {
              schoolName: schoolName,
              adminName: adminName,
              adminCode: adminCode,
            },
          });
        }
      })
      .catch((err) => {
        setIsLoading(false);
        toast.error(err, { id: uniqid });
      });
  };
  return (
    <div className="index-container">
      <div>
        <Toaster position="top-center" />
      </div>
      <section className="index-container__text-cont" id="home">
        <header className="navigations">
          <h4 className="logo-text">paymof</h4>
          <nav>
            <a className="active" href="#home">
              Home
            </a>
            <a href="#about">About us</a>
            <a href="#contact">Contact</a>
            <a href="#" onClick={() => navigate("../login")}>
              Sign In
            </a>
          </nav>
        </header>
        <div className="body-texts">
          <animated.div className="text-cont" style={{ ...textProps }}>
            <h1>Streamline Your School's Finances with Paymof</h1>
            <h5>
              Say goodbye to tedious financial management and hello to more time
              for what matters most. Try our app today.
            </h5>
            <div className="call-to-action">
              <animated.a href="#register" style={{ ...buttonProps }}>
                GET STARTED
              </animated.a>
            </div>
          </animated.div>
          <div className="box-container">
            <animated.h3 style={{ ...textProps }}>Services</animated.h3>
            <animated.div className="boxes" style={{ ...textProps }}>
              Our app allows you to keep track of students fee records from any
              date.
            </animated.div>
            <animated.div className="boxes" style={{ ...textProps }}>
              User-friendly app that stores financial record of students.
              Consisting of printable receipts for customers
            </animated.div>
            <animated.div className="boxes" style={{ ...textProps }}>
              Creating of report and analysis sheets every end of the week for
              review.
            </animated.div>
          </div>
        </div>
      </section>
      <section className="index-container__others" id="about">
        <div className="our-services">
          <div className="service">
            <h3>Efficiency</h3>
            Manage your school's financial records and transactions in a
            streamlined and efficient manner, freeing up valuable time for you
            and your staff to focus on other important aspects of running your
            school. Easy and user friendly application for storing finance
            records in a relational format.
            <br />
            <button>Learn More</button>
          </div>
          <div className="service-img">
            <img
              src="../../../assets/images/cover-1609951248464938.png"
              alt=""
            />
          </div>
        </div>
      </section>
      <section className="get-started" id="register">
        <h2>Register your school</h2>

        <p>
          Lorem ipsum dolor sit amet consectetur Lorem, ipsum dolor sit amet
          consectetur adipisicing elit. Quis, optio? adipisicing elit. Et
          delectus quidem fugiat libero atque modi!
        </p>
        <form>
          {!showElem ? (
            <>
              <div className="school-cont">
                <div className="p-inputgroup">
                  {/* <label htmlFor="school">School Name</label> */}
                  <InputText
                    aria-describedby="username-help"
                    value={schoolName}
                    onChange={(e) => setSchoolName(e.target.value)}
                    placeholder="School Name"
                  />
                  <Button
                    icon="pi pi-check-circle"
                    label="Proceed"
                    className="p-button-secondary"
                    loading={isLoading}
                    onClick={(e) => handleSchoolName(e)}
                  />
                </div>
                <small id="school-help" style={{ color: "#7a7a7a" }}>
                  avoid using symbols and special characters
                </small>
              </div>
            </>
          ) : (
            <>
              <input
                type="text"
                value={schoolName}
                disabled
                className="disabled_schoolName"
              />
              <div className="reg-admin">
                <InputText
                  // type="text"
                  placeholder="Admin Name"
                  id="admin-name"
                  onChange={(e) => setAdminName(e.target.value)}
                  value={adminName}
                />
                <Password
                  placeholder="Admin Password"
                  id="admin-code"
                  onChange={(e) => setAdminCode(e.target.value)}
                  value={adminCode}
                  feedback={false}
                  toggleMask
                />
                <InputText
                  type="tel"
                  placeholder="Phone Number"
                  id="admin-phone"
                  onChange={(e) => setPhone(e.target.value)}
                  value={phone}
                  keyfilter="pnum"
                />
                <InputText
                  placeholder="Email Address"
                  id="admin-email"
                  onChange={(e) => setEmail(e.target.value)}
                  value={email}
                  keyfilter="email"
                />
                <label htmlFor="customLogin">
                  <input
                    type="checkbox"
                    id="customLogin"
                    checked={customLogin}
                    onChange={(e) => setCustomLogin(e.target.checked)}
                  />
                  Create custom login
                </label>
              </div>
              <Button
                onClick={handleAdminCred}
                loading={isLoading}
                icon="pi pi-check"
                label="Continue"
                severity="secondary"
              >
                <Ripple />
              </Button>
            </>
          )}
        </form>
      </section>
      <section className="contact" id="contact">
        <div className="contact-grid">
          <div className="text-cont">
            <h3>Contact</h3>
            <p>
              I would love to get feedbacks from you and how i can help. please
              fill in the form and I'll get back to you as soon as possible
            </p>
          </div>
          <div className="form">
            <form action="">
              <input type="text" id="name" placeholder="NAME" />
              <input type="email" id="email" placeholder="EMAIL" />
              <textarea
                id="message"
                cols="60"
                rows="3"
                placeholder="MESSAGE"
              ></textarea>
              <div className="btn-cont">
                <button type="submit">SEND MESSAGE</button>
              </div>
            </form>
          </div>
        </div>
        <div className="social">
          <hr />
          <div className="text-cont">
            <a href="#">teetech</a>
            <div className="icons">
              <a href="#">
                {" "}
                <RiGithubFill />
              </a>
              <a href="#">
                <RiLinkedinBoxFill />
              </a>
              <a href="#">
                <RiTwitterFill />
              </a>
              <a href="#">
                <RiGoogleFill />
              </a>
              <a href="#">
                <RiInstagramFill />
              </a>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};

export default Index;
