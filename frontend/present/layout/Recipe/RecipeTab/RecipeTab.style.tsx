import { theme } from "@/constant/theme";
import styled from "styled-components";

export const Ingredient = styled.div`
  display: flex;
  font-family: "Pretendard-Light";
  width: 25%;
  align-items: center;
  justify-content: space-between;
  font-size: 1rem;
`;

export const IngredientPhoto = styled.div`
  display: flex;
  align-items: center;
  gap: 1rem;
  & p {
    font-family: "Inter-Medium";
    color: ${theme.colors.main.grey};
  }
`;

export const IngredientCompo = styled.div`
  background-color: #ffdce1;
  width: calc(100% - 4rem);
  border-radius: 1rem;
  padding: 2rem !important;
  margin: 1rem 0 2rem 0 !important;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-between;
  gap: 1rem;
`;

export const RecipeProcessCompo = styled.div`
  display: grid;
  gap: 1rem;
  align-items: center;
  margin-bottom: 1rem !important;

  & img {
    width: 8rem;
    height: 5rem;
    object-fit: cover;
    border-radius: 1rem;
  }

  & div {
    font-family: "Pretendard-Light";
    font-size: 1rem;
    line-height: 1.3rem;
  }

  ${theme.devices.desktop} {
    grid-template-columns: 1fr 5fr;
  }

  ${theme.devices.tablet} {
    grid-template-columns: 1fr 3fr;
  }

  ${theme.devices.mobile} {
    display: flex;
    flex-direction: column;
  }
`;

export const RecipeTabBody = styled.div`
  display: flex;
  justify-content: left;
  flex-direction: column;
  gap: 1rem;
  & h2 {
    display: none;
  }

  ${theme.devices.tablet} {
    display: block;
  }
`;

export const RecipeTabHeader = styled.div`
  display: flex;
  flex-wrap: wrap;
  align-items: flex-end;
  justify-content: flex-start;
  gap: 0.5rem;

  h2 {
    font-family: "Pretendard-SemiBold" !important;
    font-size: 1.2rem;
  }

  p {
    font-family: "Pretendard-Light";
    font-size: 0.8rem;
  }
`;

export const Container = styled.div`
  & * {
    padding: 0;
    margin: 0;
  }

  ${theme.devices.tablet} {
    padding-top: 6rem;
  }
`;
