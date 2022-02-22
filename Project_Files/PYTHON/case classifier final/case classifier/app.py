from flask import Flask, request, render_template
import pandas as pd
import joblib


# Declare a Flask app
app = Flask(__name__)


@app.route("/", methods=["GET", "POST"])
def main():

    # If a form is submitted
    if request.method == "POST":

        # Unpickle classifier
        clf = joblib.load("clf.pkl")

        # Get values through input bars
        # height = request.form.get("height")
        # weight = request.form.get("weight")
        status = request.form.get("status")
        department = request.form.get("department")
        rating = request.form.get("rating")
        billingcountry = request.form.get("billingcountry")
        industry = request.form.get("industry")
        application = request.form.get("application")
        leadtype = request.form.get("leadtype")
        pardotscore = request.form.get("pardotscore")

        # logic to convert into required form
        if status == "open":
            status_ = 1
        else:
            status_ = 0
        if department == "ac":
            department_ac = 1
            department_ba = 0
            department_pemd = 0
            department_docb = 0
        elif department == "ba":
            department_ac = 0
            department_ba = 1
            department_pemd = 0
            department_docb = 0
        elif department == "pemd":
            department_ac = 0
            department_ba = 0
            department_pemd = 1
            department_docb = 0
        elif department == "docb":
            department_ac = 0
            department_ba = 0
            department_pemd = 0
            department_docb = 1

        if billingcountry == "china":
            billingcountry_ = 1
        elif billingcountry == "indonesia":
            billingcountry_ = 2
        elif billingcountry == "russia":
            billingcountry_ = 3
        else:
            billingcountry_ = 4

        if industry == "healthcare":
            industry_h = 1
            industry_l = 0
            industry_s = 0
        elif industry == "lifesciences":
            industry_h = 0
            industry_l = 1
            industry_s = 0
        else:
            industry_h = 0
            industry_l = 0
            industry_s = 1

        if application == "aam":
            application_aam = 1
            application_b = 0
            application_cl = 0
            application_ipa = 0
            application_m = 0
            application_pm = 0
        elif application == "b":
            application_aam = 0
            application_b = 1
            application_cl = 0
            application_ipa = 0
            application_m = 0
            application_pm = 0
        elif application == "cl":
            application_aam = 0
            application_b = 0
            application_cl = 1
            application_ipa = 0
            application_m = 0
            application_pm = 0
        elif application == "ipa":
            application_aam = 0
            application_b = 0
            application_cl = 0
            application_ipa = 1
            application_m = 0
            application_pm = 0
        elif application == "m":
            application_aam = 0
            application_b = 0
            application_cl = 0
            application_ipa = 0
            application_m = 1
            application_pm = 0
        elif application == "pm":
            application_aam = 0
            application_b = 0
            application_cl = 0
            application_ipa = 0
            application_m = 0
            application_pm = 1

        if leadtype == "bd":
            leadtype_bd = 1
            leadtype_i = 0
            leadtype_pc = 0
        elif leadtype == "i":
            leadtype_bd = 0
            leadtype_i = 1
            leadtype_pc = 0
        else:
            leadtype_bd = 0
            leadtype_i = 0
            leadtype_pc = 1

        # Put inputs to dataframe
        X = pd.DataFrame(
            [
                [
                    status_,
                    rating,
                    billingcountry_,
                    department_ac,
                    department_ba,
                    department_pemd,
                    department_docb,
                    industry_h,
                    industry_l,
                    industry_s,
                    application_aam,
                    application_b,
                    application_cl,
                    application_ipa,
                    application_m,
                    application_pm,
                    leadtype_bd,
                    leadtype_i,
                    leadtype_pc,
                ]
            ],
            columns=[
                "STATUS",
                "ACCOUNT_RATING",
                "BILLING_COUNTRY",
                "DEPARTMENT_Analytical Chemistry",
                "DEPARTMENT_BioAnalytics",
                "DEPARTMENT_Department of Computational Biology",
                "DEPARTMENT_Protein Expression & Modification Division",
                "INDUSTRY_Healthcare",
                "INDUSTRY_Life Sciences",
                "INDUSTRY_Safety & Security",
                "APPLICATION_Amino Acids & Metobolites",
                "APPLICATION_Biotherapeutics",
                "APPLICATION_Cell Lysates",
                "APPLICATION_Intact Proteins & Antibodies",
                "APPLICATION_Metabolomics",
                "APPLICATION_Peptide Mapping",
                "LEAD_TYPE_Bus Dev",
                "LEAD_TYPE_Influencer",
                "LEAD_TYPE_Potential Customer",
            ],
        )

        # Get prediction
        prediction = int(clf.predict(X))
        if prediction:
            prediction="According to our algorithm the case will be active"
        else:
            prediction = "According to our algorithm the case will be inactive"

    else:
        prediction = ""

    return render_template("website.html", output=prediction)


# Running the app
if __name__ == "__main__":
    app.run(debug=True)
