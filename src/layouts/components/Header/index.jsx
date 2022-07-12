import { Box, Typography, Button } from "@mui/material";
import { useCustomTheme } from "src/contexts/themeContext";
import SearchBar from "src/components/SearchBar";
import { NavLink } from "react-router-dom";
import { useAccountContext } from "src/contexts/accountContext";

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

  return (
    <Box
      component="header"
      id="header"
      display="flex"
      justifyContent="center"
      sx={{
        height: 55,
        width: "100%",
        position: { xsm: "fixed" },
        top: 0,
        left: 0,
        backgroundImage: `linear-gradient(to right, ${bleuDeFrance} , ${lightSkyBlue})`,
        borderBottomWidth: 1,
        borderBottomColor: "divider",
        borderBottomStyle: "solid",
        zIndex: 1201,
      }}
    >
      <Box
        display="flex"
        width="80%"
        justifyContent="space-between"
        alignItems="center"
      >
        <Typography
          variant="h4"
          sx={{ color: aliceBlue, fontFamily: "Ubuntu", fontWeight: "bold" }}
        >
          HUST Manga
        </Typography>
        <SearchBar />

        {account ? (
          <Box display="flex" alignItems="center">
            <Typography
              sx={{ fontFamily: "ubuntu", color: greenBlue, mr: 0.5 }}
            >
              Welcome
            </Typography>
            <Typography
              sx={{
                fontFamily: "ubuntu",
                fontWeight: "bold",
                mr: 1,
                color: cobaltBlue,
              }}
            >
              {account}
            </Typography>
            <Button
              variant="contained"
              sx={{ borderRadius: 10, background: brightNavyBlue }}
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
        ) : (
          <Box display="flex">
            <NavLink to="/login" style={{ textDecoration: "none" }}>
              <Button
                variant="contained"
                sx={{ mr: 3, borderRadius: 10, background: brightNavyBlue }}
              >
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
            <NavLink to="/register" style={{ textDecoration: "none" }}>
              <Button
                variant="contained"
                sx={{ borderRadius: 10, background: brightNavyBlue }}
              >
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
  );
}
