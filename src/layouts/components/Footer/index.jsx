import { Box, Link, Typography } from "@mui/material";
import { Fragment } from "react";
import ScrollToTop from "./ScrollToTop";

export default function Footer() {
  return (
    <Fragment>
      <Box
        component="footer"
        sx={{
          pt: 4,
          pb: 2,
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          flexDirection: { xs: "column", sm: "row" },
          gap: 1,
        }}
      >
        <Box sx={{ order: 1 }}>
          <Typography
            variant="body2"
            color="secondary.main"
            align="center"
            gutterBottom
          >
            COPYRIGHT © 2021{" "}
            <Link
              display="inline"
              href="https://trava.finance"
              sx={{
                textDecoration: "none",
                "&:hover": { textDecoration: "underline" },
              }}
            >
              Trava.Finance
            </Link>
            . All rights reserved
          </Typography>
        </Box>
        <Box
          sx={{
            order: { xs: 0, sm: 2 },
            display: "flex",
            gap: 1.5,
            mr: { xs: 0, sm: 5 },
          }}
        >
          <Link
            target="_blank"
            href="https://t.me/trava_finance"
            rel="noreferrer noopener"
            sx={{
              color: "secondary.main",
              "&:hover": { color: "primary.main" },
            }}
          >
          </Link>
          <Link
            target="_blank"
            href="https://twitter.com/trava_finance"
            rel="noreferrer noopener"
            sx={{
              color: "secondary.main",
              "&:hover": { color: "primary.main" },
            }}
          >
          </Link>
          <Link
            target="_blank"
            href="https://medium.com/@travafinance"
            rel="noreferrer noopener"
            sx={{
              color: "secondary.main",
              "&:hover": { color: "primary.main" },
            }}
          >
          </Link>
          <Link
            target="_blank"
            href="https://www.reddit.com/r/TravaFinance"
            rel="noreferrer noopener"
            sx={{
              color: "secondary.main",
              "&:hover": { color: "primary.main" },
            }}
          >
          </Link>
        </Box>
      </Box>
      <ScrollToTop />
    </Fragment>
  );
}
