import { Drawer, Box, Typography, Button } from "@mui/material";
import { useCustomTheme } from "src/contexts/themeContext";
import { NavLink } from "react-router-dom";
import { useAccountContext } from "src/contexts/accountContext";

export default function MobileDrawer({ open, setOpen, isMobile }) {
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
    <Drawer
      open={open}
      onClose={() => setOpen(false)}
      anchor="right"
      PaperProps={{
        sx: {
          width: 260,
          background: cobaltBlue,
          top: 55,
        },
      }}
    >
      <Box
        display="flex"
        flexDirection="column"
        justifyContent="top"
        alignItems="center"
        sx={{
          height: "100%",
          width: "100%",
        }}
      >
        <NavLink to="/" style={{ textDecoration: "none" }}>
          <Typography
            variant="h5"
            sx={{
              color: "white",
              fontFamily: "ubuntu",
              fontWeight: "bold",
              my: 3,
            }}
          >
            HUST Manga
          </Typography>
        </NavLink>
        {!isMobile && account && (
          <Box display="flex" flexDirection="column" alignItems="center">
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
            </Box>
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
    </Drawer>
  );
}
