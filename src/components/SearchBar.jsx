import SearchIcon from "@mui/icons-material/Search";
import { InputBase, Box } from "@mui/material";
import { styled, alpha } from "@mui/material/styles";

const Search = styled("div")(({ theme }) => ({
  position: "relative",
  borderRadius: 10,
  backgroundColor: alpha(theme.palette.common.white, 0.15),
  "&:hover": {
    backgroundColor: alpha(theme.palette.common.white, 0.25),
  },
  marginRight: theme.spacing(2),
  marginLeft: 0,
  width: "100%",
  [theme.breakpoints.up("sm")]: {
    marginLeft: theme.spacing(3),
    width: "auto",
  },
}));

const SearchIconWrapper = styled("div")(({ theme }) => ({
  padding: theme.spacing(0, 2),
  height: "100%",
  position: "absolute",
  pointerEvents: "none",
  display: "flex",
  alignItems: "center",
  justifyContent: "center",
}));

const StyledInputBase = styled(InputBase)(({ theme }) => ({
  "& .MuiInputBase-input": {
    padding: theme.spacing(1, 1, 1, 0),
    paddingLeft: `calc(1em + ${theme.spacing(4)})`,
    transition: theme.transitions.create("width"),
    width: "100%",
    [theme.breakpoints.up("md")]: {
      width: "20ch",
    },
  },
}));

export default function PrimarySearchAppBar() {
  return (
    <Box sx={{ flexGrow: 0.6 }}>
      <Search>
        <SearchIconWrapper>
          <SearchIcon sx={{ color: "white", fontWeight: "bold" }} />
        </SearchIconWrapper>
        <StyledInputBase
          sx={{ fontWeight: "bold", color: "white" }}
          placeholder="Search Manga…"
          inputProps={{ "aria-label": "search" }}
        />
      </Search>
    </Box>
  );
}
