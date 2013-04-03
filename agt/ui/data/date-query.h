#ifndef DATEQUERY_H
#define DATEQUERY_H

#include <QWidget>
#include <agt/global.h>


namespace Ui {
class DateQuery;
}

class AGTSHARED_EXPORT DateQuery : public QWidget
{
    Q_OBJECT
    
public:
    explicit DateQuery(QWidget *parent = 0);
    ~DateQuery();
    QString statement() const;
public slots:
    void makeStatement();
    void setFieldName(QString);
signals:
    void fieldNameChanged(QString);
    void statementChanged(QString);

protected:
    void changeEvent(QEvent *e);
    
private:
    Ui::DateQuery *ui;
    QString fieldName;
    QString m_statement;
    const QString standardFormat;
};

#endif // DATEQUERY_H