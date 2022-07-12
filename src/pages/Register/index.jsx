import { TextField, Box, Typography, Button } from "@mui/material";
import { useCustomTheme } from "src/contexts/themeContext";
import { useHistory } from "react-router-dom";
import Background from "src/assets/images/manga_bg.jpg";
import ArrowBackIcon from "@mui/icons-material/ArrowBack";

export default function Register() {
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

  const history = useHistory();
  return (
    <Box
      height="100vh"
      width="100%"
      sx={{
        // backgroundImage: `linear-gradient(to bottom, ${cobaltBlue} , ${blueJeans2})`,
        backgroundImage: `linear-gradient(to bottom, ${cobaltBlue} , ${blueJeans2}), url(${Background})`,
        backgroundPosition: "center",
        backgroundRepeat: "no-repeat",
        backgroundSize: "cover",
        backgroundBlendMode: "multiply",
        backgroundOpacity: 0.3,
        backgroundBlur: "100px",
      }}
      display="flex"
      justifyContent="center"
      alignItems="center"
    >
      <Box
        height={500}
        width={400}
        display="flex"
        flexDirection="column"
        sx={{ background: "white", borderRadius: 5 }}
        justifyContent="center"
        alignItems="center"
      >
        <Box
          height={400}
          width={350}
          display="flex"
          flexDirection="column"
          alignItems="center"
          justifyContent="space-between"
        >
          <Typography
            variant="h5"
            sx={{
              fontFamily: "ubuntu",
              fontWeight: "bold",
            }}
          >
            Create a new account
          </Typography>
          <Box
            width={350}
            display="flex"
            flexDirection="column"
            alignItems="center"
          >
            <TextField type="text" label="Username" fullWidth sx={{ mb: 3 }} />
            <TextField
              label="Password"
              type="password"
              fullWidth
              sx={{ mb: 3 }}
            />
            <Button
              variant="contained"
              fullWidth
              type="submit"
              sx={{ height: 50, background: dodgerBlue, mb: 3 }}
            >
              <Typography
                sx={{
                  fontFamily: "ubuntu",
                  fontWeight: "bold",
                }}
              >
                Register
              </Typography>
            </Button>
            <Box
              display="flex"
              sx={{ cursor: "pointer" }}
              onClick={() => history.push("/login")}
            >
              <ArrowBackIcon sx={{ mr: 1 }} />
              <Typography sx={{ fontFamily: "ubuntu" }}>
                Back to login page
              </Typography>
            </Box>
          </Box>
        </Box>
      </Box>
    </Box>
  );
}
