.pragma library

function qmlListPropertyInsert(qmllistproperty, index, item) {
    if(index > qmllistproperty.length) return qmllistproperty;
    var  qmllistproperty_ = [];
    var length = qmllistproperty.length + 1;

    var flag = false;           // insert ?
    for(var iter = 0; iter < length; iter++) {
        if(iter === index) {
            qmllistproperty_.push(item);
            flag = true;
        } else {
            if(flag) {
                qmllistproperty_.push(qmllistproperty[iter-1]);
            } else {
                qmllistproperty_.push(qmllistproperty[iter]);
            }
        }
    }
    return qmllistproperty_;
}

function qmlListPropertyRemove(qmllistproperty, index) {
    if(index > qmllistproperty.length-1) return qmllistproperty;
    var  qmllistproperty_ = [];
    for(var iter in qmllistproperty) {
        // typeof iter is string
        // typeof index is number
        if(iter == index) {
            continue;
        } else {
            qmllistproperty_.push(qmllistproperty[iter]);
        }
    }
    return qmllistproperty_;
}
