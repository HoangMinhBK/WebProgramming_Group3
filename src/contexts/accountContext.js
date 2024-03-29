import { createContext, useContext } from "react";

const AccountContext = createContext({
  account: undefined,
  favComic: [],
  setFavComic: () => {},
  setAccount: () => {},
});

export default function AccountProvider({ children, value }) {
  return (
    <AccountContext.Provider value={value}>{children}</AccountContext.Provider>
  );
}
export const useAccountContext = () => useContext(AccountContext);
