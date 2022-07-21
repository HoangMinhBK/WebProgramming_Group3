import { Box, Link, Typography, useMediaQuery } from "@mui/material";
import { Fragment } from "react";
import ScrollToTop from "./ScrollToTop";
import Background from "src/assets/images/footer.jpg";
import MoibleBackground from "src/assets/images/mobile-footer.jpg";

export default function Footer() {
  const isMobile = useMediaQuery("(max-width: 600px)");
  return (
    <>
      <Box
        component="footer"
        sx={{
          pt: 7,
          display: "flex",
          justifyContent: "flex-start",
          alignItems: "flex-end",
          flexDirection: { xs: "column", sm: "row" },
          backgroundImage: !isMobile
            ? `url(${Background})`
            : `url(${MoibleBackground})`,
          backgroundPosition: !isMobile ? "right" : "bottom",
          backgroundRepeat: "no-repeat",
          backgroundSize: isMobile ? "cover" : undefined,
          height: !isMobile ? "350px" : "200px",
          mb: !isMobile ? -13 : undefined,
        }}
      >
        <Box
          sx={{
            position: "relative",
            background: "white",
            p: 0.1,
            borderRadius: "10px",
            mt: isMobile ? 26 : undefined,
          }}
        >
          <Typography
            variant="body2"
            fontFamily="ubuntu"
            align="center"
            sx={{ mb: !isMobile ? 4 : 0 }}
          >
            COPYRIGHT © 2022 Hoang Minh - Hai Dang - The Kiet . All rights
            reserved
          </Typography>
        </Box>
      </Box>
      <ScrollToTop />
    </>
  );
}
