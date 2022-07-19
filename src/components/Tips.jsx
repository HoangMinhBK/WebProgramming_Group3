import { Box, Typography, useMediaQuery } from "@mui/material";
import TipsAndUpdatesIcon from "@mui/icons-material/TipsAndUpdates";
import { useCustomTheme } from "src/contexts/themeContext";
import { NavLink } from "react-router-dom";
import HighlightOffIcon from "@mui/icons-material/HighlightOff";
import { useState } from "react";

export default function Tips() {
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
  const [on, setOn] = useState(true);
  return (
    <Box
      display="flex"
      alignItems="top"
      sx={{ display: !on ? "none" : "flex" }}
    >
      <Box
        sx={{
          width: isMobile ? "100%" : undefined,
          background: uranianBlue,
          borderRadius: "50px",
          p: 4,
        }}
        display="flex"
        flexDirection={isMobile ? "column" : "row"}
        alignItems="center"
        justifyContent="center"
      >
        <TipsAndUpdatesIcon
          sx={{ color: bleuDeFrance, mr: 2, mb: 1 }}
          fontSize="large"
        />
        <Typography
          variant="button"
          sx={{ fontFamily: "ubuntu", color: bleuDeFrance }}
        >
          To like, comment and follow your favorite mangas, please{" "}
          <NavLink
            to="/login"
            style={{
              textDecoration: "none",
              color: greenBlue,
              fontWeight: "bold",
            }}
          >
            login
          </NavLink>
        </Typography>
      </Box>
      <HighlightOffIcon
        position="relative"
        sx={{ ml: -3, color: brightNavyBlue, cursor: "pointer" }}
        onClick={() => setOn(false)}
      />
    </Box>
  );
}
