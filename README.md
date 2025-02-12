# NHANES Data Analysis: Association Between Caffeine Intake and Gallstone Formation ☕🩺  

## 📌 Overview  

This project investigates the **association between caffeine intake and the risk of gallstone formation** using data from the **NHANES 2017-2018 survey**. The study explores whether **caffeine consumption influences gallstone prevalence** and whether this relationship **differs by gender**. Using **logistic regression models**, we assess the role of **demographic, lifestyle, and dietary factors** in modifying this association.

---

## 🔍 Research Objective  

- **Analyze the relationship between caffeine intake and gallstones/cholecystectomy occurrence**  
- **Evaluate the role of demographic (sex, age, race) and dietary (fiber, fat, cholesterol) factors**  
- **Investigate whether the effect of caffeine varies between men and women**  

---

## 📊 Dataset  

We utilize the **NHANES 2017-2018** dataset from the **CDC** (Centers for Disease Control and Prevention), which includes:  

- **9,254 participants initially** → **3,793 included after applying exclusion criteria**  
- **Categorized caffeine intake levels**:  
  - **Low (≤50mg)**  
  - **Normal (51-200mg, reference group)**  
  - **High (201-400mg)**  
  - **Very High (>401mg)**  

- **Covariates Considered**:  
  - **Demographics**: Age, Sex, Race/Ethnicity, Education  
  - **Lifestyle Factors**: BMI, Physical Activity, Smoking, Alcohol Intake  
  - **Dietary Factors**: Fiber, Fat, Cholesterol, Vitamin C, Water Intake  

---

## 📈 Methodology  

### **1️⃣ Data Preprocessing & Study Design**  
- Excluded participants **under 20 years old, pregnant individuals, and diabetics**  
- Caffeine intake data obtained from **24-hour dietary recall surveys**  
- Gallstone/cholecystectomy status was **self-reported (binary: Yes/No)**  

### **2️⃣ Statistical Analysis**  
- **Descriptive Analysis**: Mean comparisons (t-tests) & categorical analysis (chi-square tests)  
- **Logistic Regression Models**:  
  - **Unadjusted Model**: Caffeine intake as the sole predictor  
  - **Adjusted Model**: Added covariates (age, sex, race, BMI, fiber, fat)  
  - **Interaction Model**: Tested **caffeine intake × sex interaction**  

- **Model Evaluation**:  
  - Akaike Information Criterion (AIC) & Bayesian Information Criterion (BIC)  
  - Pseudo-R² values for goodness-of-fit  
  - Variance Inflation Factor (VIF) to check for collinearity  

---

## 📏 Results & Findings  

| Predictor | Odds Ratio (OR) | 95% CI | p-value |
|-----------|-------------|------------|---------|
| **Sex (Female vs. Male)** | **2.53** | (1.61, 3.99) | **0.007** |
| **Age (per year increase)** | **1.04** | (1.03, 1.05) | **<0.001** |
| **BMI (per unit increase)** | **1.08** | (1.05, 1.11) | **0.003** |
| **Race (Black vs. White)** | **0.45** | (0.19, 1.07) | **0.060** |
| **Caffeine Intake (Very High vs. Normal)** | **0.86** | (0.28, 2.64) | **0.797** |
| **Caffeine × Sex Interaction** | - | - | **0.014** |

**Key Takeaways:**  
✅ **No direct association** was found between caffeine intake and gallstones.  
✅ **Women had 2.5x higher odds** of gallstones compared to men.  
✅ **Higher BMI & age** were significantly linked to gallstones.  
✅ **Men showed a protective trend** at very high caffeine intake, while women did not.  
