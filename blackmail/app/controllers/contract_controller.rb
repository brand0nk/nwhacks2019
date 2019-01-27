class ContractController < ApplicationController

  def download
  end

  def create
  end

  def new
    render plain: params

    contract = params[:contract]
    # get owner uid from session
    condition = contract.require(:contract) # the task to be completed
    content = contract.require(:content) # the secret held as collateral
    password = contract.require(:password)
    receiverUID = contract.require(:receiverUID)
    deadline = contract.require(:deadline) # deadline in s since epoch

    # for now, skipping crypto to get the upload/dl working.
    @contract = Contract.new(
        ownerUID: "a",
        receiverUID: receiverUID,
        content: content,
        pwhash: password,
        task: contract,
        expiration: deadline)
    @contract.save()

  end
end