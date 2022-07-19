import { Box, Typography, Button, Divider, useMediaQuery } from "@mui/material";
import MenuIcon from "@mui/icons-material/Menu";
import { useCustomTheme } from "src/contexts/themeContext";
import SearchBar from "src/components/SearchBar";
import { NavLink } from "react-router-dom";
import { useAccountContext } from "src/contexts/accountContext";
import MobileDrawer from "src/layouts/components/Header/MobileDrawer";
import { useState } from "react";

export default function Header() {
  const { account, setAccount } = useAccountContext();
  const {
    aliceBlue,
    uranianBlue,
    lightSkyBlue,
    blueJeans,
    blueJeans2,
    dodgerBlue,
    bleuDeFrance,
    brightNavyBlue,
    greenBlue,
    cobaltBlue,
  } = useCustomTheme();

  const isMobile = useMediaQuery("(max-width: 600px)");
  const [openDrawer, setOpenDrawer] = useState(false);

  return (
    <>
      <MobileDrawer open={openDrawer} setOpen={setOpenDrawer} />
      <Box
        component="header"
        id="header"
        display="flex"
        justifyContent="center"
        sx={{
          height: 55,
          width: "100%",
          position: "fixed",
          top: 0,
          left: 0,
          // backgroundImage: `linear-gradient(to right, ${bleuDeFrance} , ${lightSkyBlue})`,
          backgroundImage: `linear-gradient(to left, ${cobaltBlue} , ${dodgerBlue})`,
          borderBottomWidth: 1,
          borderBottomColor: "divider",
          borderBottomStyle: "solid",
          zIndex: 1201,
        }}
      >
        <Box
          display="flex"
          width="80%"
          justifyContent={isMobile ? "center" : "space-between"}
          alignItems="center"
        >
          {!isMobile && (
            <NavLink to="/" style={{ textDecoration: "none" }}>
              <Typography
                variant="h4"
                sx={{
                  color: aliceBlue,
                  fontFamily: "Ubuntu",
                  fontWeight: "bold",
                }}
              >
                HUST Manga
              </Typography>
            </NavLink>
          )}
          <SearchBar />
          {isMobile && (
            <Button sx={{ mr: -4 }} onClick={() => setOpenDrawer(true)}>
              <MenuIcon sx={{ color: "rgba(255, 255, 255, 255, 0.7)" }} />
            </Button>
          )}
          {!isMobile && account && (
            <Box display="flex" alignItems="center">
              <Typography
                sx={{ fontFamily: "ubuntu", color: "white", mr: 0.5 }}
              >
                Welcome
              </Typography>
              <Typography
                sx={{
                  fontFamily: "ubuntu",
                  fontWeight: "bold",
                  mr: 1,
                  color: "white",
                }}
              >
                {account}
              </Typography>
              <Button
                onClick={() => {
                  setAccount(undefined);
                  localStorage.removeItem("account");
                  localStorage.removeItem("jwt");
                }}
              >
                <Typography
                  sx={{
                    color: aliceBlue,
                    fontFamily: "Ubuntu",
                    fontWeight: "bold",
                  }}
                >
                  Logout
                </Typography>
              </Button>
            </Box>
          )}

          {!isMobile && !account && (
            <Box display="flex">
              <NavLink to="/login" style={{ textDecoration: "none" }}>
                <Button sx={{ mr: 3 }}>
                  <Typography
                    sx={{
                      color: aliceBlue,
                      fontFamily: "Ubuntu",
                      fontWeight: "bold",
                    }}
                  >
                    Login
                  </Typography>
                </Button>
              </NavLink>
              <Divider orientation="vertical" />
              <NavLink to="/register" style={{ textDecoration: "none" }}>
                <Button>
                  <Typography
                    sx={{
                      color: aliceBlue,
                      fontFamily: "Ubuntu",
                      fontWeight: "bold",
                    }}
                  >
                    Register
                  </Typography>
                </Button>
              </NavLink>
            </Box>
          )}
        </Box>
      </Box>
    </>
  );
}
